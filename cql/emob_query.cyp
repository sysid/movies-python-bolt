//MATCH (home:Usecase {name:'home-charging'})
//return *
//;

//MATCH (n:Usecase)
//where n.name = 'home-charging' or n.name = 'l100'
//return *
//;

// find product with two constraints
//:param useCase1 => 'home-charging'
//:param useCase2 => 'l100'
//MATCH
//    (u1:Usecase)--(product),
//    (u2:Usecase)--(product)
//where
//    u1.name = $useCase1
//    and u2.name = $useCase2
//return product
//;

// get all nodes affected by constrain transitively
MATCH path1 = (c:Constraint)-[:EXCLUDES]->(product:Product)
    where c.name in ['small_home']
    OPTIONAL MATCH path2 = (p)<-[:REQUIRES*]-(q:Product)
    unwind nodes(path1) + nodes(path2) as m
    with m
    where not m:Constraint
    return distinct m
//    return distinct [x in nodes(p1) where x:Product]


// Chain the constraints together
//MATCH (u1:Usecase)-[:REQUIRES*]->(product:Product)
//where u1.name in ['home-charging']
//and all(
//    node in nodes((c:Constraint)-[:EXCLUDES]->(p:Product)<-[:REQUIRES*]-(q:Product))
//    where c.name in ['small_home']
//)
//return distinct product
//;
// find product with no match
//MATCH (n:Usecase)--(product)--(m:Usecase)
//where n.name = 'bdl' and m.name = 'l100'
//return *
//;
