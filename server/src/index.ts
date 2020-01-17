import express from "express";
import keys from "./keys";

// Express App Setup
import bodyParser from "body-parser";
import cors from "cors";
import { Pool } from "pg";

const app = express();
app.use(cors());
app.use(bodyParser.json());

// Postgres Client Setup
const pgClient = new Pool({
  user: keys.pgUser,
  host: keys.pgHost,
  database: keys.pgDatabase,
  password: keys.pgPassword,
  port: keys.pgPort
});
pgClient.on("error", () => console.log("Lost PG connection"));

app.get("/", (req, res) => {
  res.send("lllljHi");
});

//familytree=# SELECT * FROM (SELECT * FROM person JOIN parent_child ON person.person_id=parent_child.parent_id WHERE person.person_id=1) as parent, LATERAL (SELECT * FROM person WHERE parent.child_id=person.person_id) as child;
//familytree=# WITH RECURSIVE family_tree(id, first_name, child_id, depth) AS (SELECT p.person_id, p.first_name, cp.child_id, 1 FROM person p, parent_child cp WHERE p.person_id=cp.parent_id AND p.person_id=1  UNION ALL SELECT p.person_id, p.first_name, cp.child_id, t.depth FROM person p, family_tree t, parent_child cp WHERE p.person_id=t.child_id  AND p.person_id=cp.parent_id) SELECT * FROM family_tree;

app.get("/children/:id", async (req,res) => {

  const { rows } = await pgClient.query(`
  WITH RECURSIVE family_tree(child_id,parent_id) AS ( 
    SELECT child_id, parent_id FROM parent_child pc 
    UNION ALL SELECT pc.child_id, pc.parent_id FROM family_tree t 
    INNER JOIN parent_child pc ON pc.parent_id=t.child_id) 
    SELECT DISTINCT p.first_name, t.child_id FROM family_tree t 
    INNER JOIN person p ON t.parent_id=p.person_id
    WHERE p.person_id=$1;
  `,[req.params.id])

  return res.send(rows)
})

app.listen(5000, (err) => {
  console.log("Listening");
});
