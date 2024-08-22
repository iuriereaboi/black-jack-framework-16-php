<?php

/**
 * A Class to act as Repository for the Table Country
 */
class GameTable extends TableEntity
{

    /**
     * ConstructoGameTable Class
     *
     * @param MySQLi $databaseConnection The database connection object.
     */
    function __construct($databaseConnection)
    {
        parent::__construct($databaseConnection, 'games');  //the name of the table is passed to the parent constructor
    }


    /**
     * Inserts a new record in the table.
     *
     * @param array $postArray containing data to be inserted
     * $postArray['games'] string games Name
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
        $gameName = addslashes($gameName);


        //construct the INSERT SQL
        $this->SQL = "INSERT INTO result (games) VALUES ('$gameName')";


        //execute the  query
        $rs = $this->db->query($this->SQL);
        return true;
    }


    /**
     * Performs a DELETE query for a single record ($gameResult).  Verifies the
     * record exists before attempting to delete
     *
     * @param $gameResult  String containing ID of games record to be deleted
     *
     * @return boolean Returns FALSE on failure. For successful DELETE returns TRUE
     */
    public function deleteRecordById($idGame)
    {
        if (!$this->getRecordByID($idGame))
            return false;

        $sql = "DELETE FROM games WHERE ID='$idGame'";

        $this->db->query($sql);
        return true;
    }

    /**
     * Performs a SELECT query to returns all records from the table.
     * gameResult betAmount columns only.
     *
     * @return mixed Returns false on failure. For successful SELECT returns a mysqli_result object $rs
     */
    public function getAllRecords()
    {
        $sql = 'SELECT gameResult, betAmount FROM games';  //construct the SQL
        return $this->db->query($sql);
    }
    /**
     * Returns a partial record  betAmount only by ID)
     *
     * @param string $gameResult
     * @return mixed Returns false on failure. For successful SELECT returns a mysqli_result object $rs
     */
    public function getRecordByID($gameResult)
    {
        $sql = "SELECT gameResult, betAmount FROM games WHERE gameResult = '$gameResult'";
        return $this->db->query($sql);
    }
    public function updateRecord($postArray)
    {
        //get the values entered in the registration form contained in the $postArray argument
        extract($postArray);

        //add escape to special characters
        $chips = addslashes($chips);//
        $gameResult = (integer)$gameResult;

        //construct the INSERT SQL
        $sql = "UPDATE games SET betAmount='$chips' WHERE gamesId='$gameResult'";

        //execute the query
        $rs = $this->db->query($sql);
        if ($this->db->affected_rows === 1 && $rs) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

