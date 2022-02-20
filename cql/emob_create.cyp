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
(home:Usecase {name:'home-charging'}),
(bdl:Usecase {name:'bdl'})

// Products
CREATE
(cp1:Product {name:'cp1', type:'AC'}),
(cp2:Product {name:'cp2', type:'AC'}),
(cp3:Product {name:'cp3', type:'AC'}),
(eg:Product {name:'eg', type:'EnergyContract'}),
(ep:Product {name:'ep', type:'EnergyContract'}),
(powerplug:Product {name:'powerplug', type:'PowerPlug'})

// Constraints
CREATE
(small_home:Constraint {name:'small_home'}),
(l1:Constraint {name:'l1', power:100}),
(l1)-[:EXCLUDES]->(cp2),
(l1)-[:EXCLUDES]->(cp3),
(small_home)-[:EXCLUDES]->(cp2),
(small_home)-[:EXCLUDES]->(powerplug)

// caras
//CREATE
//(i3:Car {name:'i3', type:'BEV', comment:'old'}),
//(ix:Car {name:'IX', type:'BEV', comment:'new'}),
//(ix)-[:REQUIRES]->(l1k),
//(ix)-[:REQUIRES]->(ep)

// Link EVERY usecase to EVERY product (AND selections)
CREATE
(home)-[:REQUIRES {crd: 'at_least_one'}]->(cp1),
(home)-[:REQUIRES {crd: 'at_least_one'}]->(cp2),
(home)-[:REQUIRES {crd: 'at_least_one'}]->(cp3),
(home)-[:REQUIRES {crd: 'one'}]->(eg),
(home)-[:REQUIRES {crd: 'one'}]->(ep),

(bdl)-[:REQUIRES {crd: 'at_least_one'}]->(cp2),
(bdl)-[:REQUIRES {crd: 'at_least_one'}]->(cp3),
(bdl)-[:REQUIRES {crd: 'at_least_one'}]->(ep),

(cp3)-[:REQUIRES {crd: 'one'}]->(ep)-[:REQUIRES {crd: 'at_least_one'}]->(powerplug)
;
