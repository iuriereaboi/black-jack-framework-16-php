<?php

/**
 * A Class to act as Repository for the Table Country
 */
class PlayerTable extends TableEntity
{

    /**
     * Constructor for the gamesTable Class
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
        $gameId = addslashes($games);


        //construct the INSERT SQL
        $this->SQL = "INSERT INTO games (gameId) VALUES ('$gameId')";


        //execute the  query
        $rs = $this->db->query($this->SQL);
        return true;
    }


    /**
     * Performs a DELETE query for a single record ($gameDate).  Verifies the
     * record exists before attempting to delete
     *
     * @param $gameDate  String containing ID of games record to be deleted
     *
     * @return boolean Returns FALSE on failure. For successful DELETE returns TRUE
     */
    public function deleteRecordById($gameDate)
    {
        if (!$this->getRecordByID($gameDate))
            return false;

        $sql = "DELETE FROM games WHERE ID='$gameDate'";

        $this->db->query($sql);
        return true;
    }

    /**
     * Performs a SELECT query to returns all records from the table.
     * gameDate,gameId columns only.
     *
     * @return mixed Returns false on failure. For successful SELECT returns a mysqli_result object $rs
     */
    public function getAllRecords()
    {
        $sql = 'SELECT gameDate, gameId FROM games';  //construct the SQL
        return $this->db->query($sql);
    }
    /**
     * Returns a partial record (gameId only by ID)
     *
     * @param string $gameDate
     * @return mixed Returns false on failure. For successful SELECT returns a mysqli_result object $rs
     */
    public function getRecordByID($gameDate)
    {
        $sql = "SELECT gameDate, gameId FROM games WHERE gameDate = '$gameDate'";
        return $this->db->query($sql);
    }
    public function updateRecord($postArray)
    {
        //get the values entered in the registration form contained in the $postArray argument
        extract($postArray);

        //add escape to special characters
        $name = addslashes($name);//
        $gameDate = (integer)$gameDate;

        //construct the INSERT SQL
        $sql = "UPDATE games SET gameId='$name' WHERE gamesId='$gameDate'";

        //execute the query
        $rs = $this->db->query($sql);
        if ($this->db->affected_rows === 1 && $rs) {
            return TRUE;
        } else {
            return FALSE;
        }
    }
}

