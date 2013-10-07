<?php
class Site{
    private $db;
    private $filters = array(
        'fields' => array(),
        'values' => array()
    );
    private $FilterTables = array(
        'channel'       => 'channels',
        'distance'      => 'distances',
        'mounting'      => 'mountings',
        'settingtype'   => 'settingtypes',
        'type'          => 'types',
        'videotype'     => 'videotypes',
        'voltage'       => 'voltages'
    );
    private $queryFields = array(
        't.id as tid',
        't.name as tname',
        'r.id as rid',
        'r.name as rname'
    );

    function __construct($farr, &$db) {
        $this->db = $db;

        $this->setFilters($farr);
    }

    private function setFilters(&$farr) {
        foreach ($farr as $k => $v) {
            if ($v != -1) {
                switch ($k) {
                    case 'channel':
                        $this->filters['fields'][] = 'r.channels LIKE %%s%';
                        break;
                    case 'distance':
                        $this->filters['fields'][] = 'r.distance LIKE %%s:like%';
                        $this->filters['fields'][] = 't.distance LIKE %%s:like%';
                        $this->filters['values'][] = $v;
                        break;
                    case 'mounting': $this->filters['fields'][] = 't.mounting = %d'; break;
                    case 'settingtype': $this->filters['fields'][] = 'r.setting_type = %d'; break;
                    case 'temperature':
                        $this->filters['fields'][] = 't.temp_min <= %d';
                        $this->filters['fields'][] = 't.temp_max >= %d';
                        $this->filters['values'][] = $v;
                        break;
                    case 'type': $this->filters['fields'][] = 'r.type LIKE %%s%'; break;
                    case 'videotype': $this->filters['fields'][] = 'r.video_type = %d'; break;
                    case 'voltage': $this->filters['fields'][] = "t.voltage LIKE %%s:like%"; break;
                    default: break;
                }
                $this->filters['values'][] = $v;
            }
        }
    }

    public function getProductsHtml() {
        $res = array(
            'transmitters'  => array(),
            'recievers'     => array()
        );

        $this->filters['fields'] = (count($this->filters['fields']) > 0) ?
                ' WHERE ' . join(' AND ', $this->filters['fields'])
            :   '';

        $r = $this->db->query('SELECT ' . join(', ', $this->queryFields) . ' FROM transmitters as t, recievers as r' . $this->filters['fields'], $this->filters['values']);
        foreach ($r as $v) {
            if (!in_array($v['tname'], $res['transmitters']))    { $res['transmitters'][]  = $v['tname']; }
            if (!in_array($v['rname'], $res['recievers']))       { $res['recievers'][]     = $v['rname']; }
        }

        $res['transmitters']    = join('<br />', $res['transmitters']);
        $res['recievers']       = join('<br />', $res['recievers']);

        return $res;
    }

    public function getFiltersHtml($val) {
        $res = '';

        if ($val == 'temperature') {
            $res .= '<input name="' . $val . '" value="' . $_POST['temperature'] . '" />';
        }
        if (array_key_exists($val, $this->FilterTables)) {
            $r = $this->db->query('SELECT * FROM ' . $this->FilterTables[$val]);
            $res = '<select name="' . $val . '">';
            $res .= '<option value="-1" ' . (!isset($_POST[$val]) || $_POST[$val] == -1 ? 'selected' : '') . '>Не важно</option>';

            foreach ($r as $rv) {
                $res .= '<option value="' . $rv['id'] . '" ' . ($_POST[$val] == $rv['id'] ? 'selected' : '') . '>' . $rv['value'] . '</option>';
            }
            $res .= '</select>';
        }

        return $res;
    }
}