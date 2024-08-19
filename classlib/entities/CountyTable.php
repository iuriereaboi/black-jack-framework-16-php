<?php

/**
 * A Class to act as Repository for the Table Country
 */
class CountyTable extends TableEntity
{

    /**
     * Constructor for the CountyTable Class
     *
     * @param MySQLi $databaseConnection The database connection object.
     */
    function __construct($databaseConnection)
    {
        parent::__construct($databaseConnection, 'county');  //the name of the table is passed to the parent constructor
    }


    /**
     * Inserts a new record in the table.
     *
     * @param array $postArray containing data to be inserted
     * $postArray['county'] string County Name
     *
     * @return boolean
     *
     *
     */
    public function createRecord($postArray)
    {

        //get the values entered in the registration form contained in the $postArray argument
        extract($postArray);

        //add escape to special characters
        $countyName = addslashes($county);


        //construct the INSERT SQL
        $this->SQL = "INSERT INTO county (countyName) VALUES ('$countyName')";


        //execute the  query
        $rs = $this->db->query($this->SQL);
        return true;
    }


    /**
     * Performs a DELETE query for a single record ($idcounty).  Verifies the
     * record exists before attempting to delete
     *
     * @param $idCounty  String containing ID of county record to be deleted
     *
     * @return boolean Returns FALSE on failure. For successful DELETE returns TRUE
     */
    public function deleteRecordById($idCounty)
    {
        if (!$this->getRecordByID($idCounty))
            return false;

        $sql = "DELETE FROM county WHERE ID='$idCounty'";

        $this->db->query($sql);
        return true;
    }

    /**
     * Performs a SELECT query to returns all records from the table.
     * idcounty,countyName columns only.
     *
     * @return mixed Returns false on failure. For successful SELECT returns a mysqli_result object $rs
     */
    public function getAllRecords()
    {
        $sql = 'SELECT idcounty, countyName FROM county';  //construct the SQL
        return $this->db->query($sql);
    }
    /**
     * Returns a partial record (countyName only by ID)
     *
     * @param string $idCounty
     * @return mixed Returns false on failure. For successful SELECT returns a mysqli_result object $rs
     */
    public function getRecordByID($idCounty)
    {
        $sql = "SELECT idcounty, countyName FROM county WHERE idcounty = '$idCounty'";
        return $this->db->query($sql);
    }
    public function updateRecord($postArray)
    {
        //get the values entered in the registration form contained in the $postArray argument
        extract($postArray);

        //add escape to special characters
        $name = addslashes($name);//
        $idCounty = (integer)$idCounty;

        //construct the INSERT SQL
        $sql = "UPDATE county SET CountyName='$name' WHERE countyId='$idCounty'";

        //execute the query
        $rs = $this->db->query($sql);
        if ($this->db->affected_rows === 1 && $rs) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

