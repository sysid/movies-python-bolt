// CREATE (n:Product {name:'chargepoint1', type:'AC', comment:'cheap stupid'})
// DROP CONSTRAINT constraint_name [IF EXISTS];

//CREATE OR REPLACE DATABASE emob;
//show databases;

//CREATE CONSTRAINT product FOR (n:Product) REQUIRE n.name IS UNIQUE;
//CREATE CONSTRAINT use_case FOR (u:Usecase) REQUIRE u.name IS UNIQUE;
//CREATE CONSTRAINT limit FOR (l:Limit) REQUIRE l.name IS UNIQUE;
//show constraints;

MATCH (n)
DETACH DELETE n;

// Use Cases
CREATE
(home:Usecase {name:'home-charging', comment:'simple home charging'}),
(bdl:Usecase {name:'bdl', comment:'bidirectional'}),
(l100:Usecase {name:'l100', power:100}),
(l1k:Usecase {name:'l1k', power:1000})

// Products
CREATE
(cp1:Product {name:'cp1', type:'AC', comment:'cheap stupid'}),
(cp2:Product {name:'cp2', type:'AC', comment:'expensive stupid'}),
(cp3:Product {name:'cp3', type:'AC', comment:'expensive smart'}),
(eg:Product {name:'eg', type:'EnergyContract', comment:'green energy'}),
(ep:Product {name:'ep', type:'EnergyContract', comment:'power energy'})

// caras
//CREATE
//(i3:Car {name:'i3', type:'BEV', comment:'old'}),
//(ix:Car {name:'IX', type:'BEV', comment:'new'}),
//(ix)-[:REQUIRES]->(l1k),
//(ix)-[:REQUIRES]->(ep)

// Link EVERY usecase to EVERY product (AND selections)
CREATE
(home)-[:REQUIRES]->(cp1),
(home)-[:REQUIRES]->(cp2),
(home)-[:REQUIRES]->(cp3),
(home)-[:REQUIRES]->(eg),
(home)-[:REQUIRES]->(ep),

(bdl)-[:REQUIRES]->(cp2),
(bdl)-[:REQUIRES]->(cp3),
(bdl)-[:REQUIRES]->(ep),

(l100)-[:REQUIRES]->(cp1),
(l100)-[:REQUIRES]->(eg),

(l1k)-[:REQUIRES]->(cp2),
(l1k)-[:REQUIRES]->(cp3),
(l1k)-[:REQUIRES]->(eg),
(l1k)-[:REQUIRES]->(ep)
//(limit2)-[:REQUIRES]->(cp1),
//(limit2)-[:REQUIRES]->(cp2)
;
