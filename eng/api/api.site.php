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
        foreach ($farr as $k => $v) {
            switch ($k) {
                case 'channel':
                    $this->filters['fields'][] = 'r.channels = %s';
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
                case 'videotype': $this->filters['fields'][] = 'r.video_type = %d'; break;
                case 'voltage': $this->filters['fields'][] = "t.voltage LIKE %%d:like%"; break;
                default: break;
            }
            $this->filters['values'][] = $v;
        }
    }

    public function getProductsHtml() {
        $res = array(
            'transmitters'  => '',
            'recievers'     => ''
        );

        $this->filters['fields'] = (count($this->filters['fields']) > 0) ?
                ' WHERE ' . join(' AND ', $this->filters['fields']) . ' GROUP BY t.name'
            :   '';

        $r = $this->db->query('SELECT ' . join(', ', $this->queryFields) . ' FROM transmitters as t, recievers as r' . $this->filters['fields'], $this->filters['values']);
        foreach ($r as $v) {
            $res['transmitters']    .= $v['tname'] . '<br />';
            $res['recievers']       .= $v['rname'] . '<br />';
        }

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

            if ($val == 'voltage') {
                $res .= '<option value="0" ' . ($_POST[$val] == 0 ? 'selected' : '') . '>Нет</option>';
            }

            foreach ($r as $rk => $rv) {
                $res .= '<option value="' . $rv['id'] . '" ' . ($_POST[$val] == $rv['val'] ? 'selected' : '') . '>' . $rv['value'] . '</option>';
            }
            $res .= '</select>';
        }

        return $res;
    }
}