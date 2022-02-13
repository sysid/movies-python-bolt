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

// Chain the constraints together
:param useCase1 => 'home-charging'
:param useCase2 => 'l1k'

MATCH (u1:Usecase)--(product)
where u1.name = $useCase1

MATCH (u2:Usecase)--(product)
where u2.name = $useCase2

return product
;
// find product with no match
//MATCH (n:Usecase)--(product)--(m:Usecase)
//where n.name = 'bdl' and m.name = 'l100'
//return *
//;
