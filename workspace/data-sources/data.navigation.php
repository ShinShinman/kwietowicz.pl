<?php

require_once(EXTENSIONS.'/page_lhandles/lib/class.datasource.MultilingualNavigation.php');

class datasourcenavigation extends MultilingualNavigationDatasource
{
    public $dsParamROOTELEMENT = 'navigation';
    public $dsParamORDER = 'asc';
    public $dsParamREDIRECTONEMPTY = 'no';
    public $dsParamREDIRECTONFORBIDDEN = 'no';
    public $dsParamREDIRECTONREQUIRED = 'no';
    public $dsParamSORT = 'sortorder';
    

    public $dsParamFILTERS = array(
        'type' => 'menu',
    );
        

    

    public function __construct($env = null, $process_params = true)
    {
        parent::__construct($env, $process_params);
        $this->_dependencies = array();
    }

    public function about()
    {
        return array(
            'name' => 'Navigation',
            'author' => array(
                'name' => 'Olaf Schindler',
                'website' => 'http://kwietowicz.local',
                'email' => 'studio@orkana39.pl'),
            'version' => 'Symphony 2.7.10',
            'release-date' => '2021-01-28T17:15:32+00:00'
        );
    }

    public function getSource()
    {
        return 'navigation';
    }

    public function allowEditorToParse()
    {
        return true;
    }

    public function execute(array &$param_pool = null)
    {
        $result = new XMLElement($this->dsParamROOTELEMENT);

        try {
            $result = parent::execute($param_pool);
        } catch (FrontendPageNotFoundException $e) {
            // Work around. This ensures the 404 page is displayed and
            // is not picked up by the default catch() statement below
            FrontendPageNotFoundExceptionHandler::render($e);
        } catch (Exception $e) {
            $result->appendChild(new XMLElement('error',
                General::wrapInCDATA($e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile())
            ));
            return $result;
        }

        if ($this->_force_empty_result) {
            $result = $this->emptyXMLSet();
        }

        if ($this->_negate_result) {
            $result = $this->negateXMLSet();
        }

        return $result;
    }
}