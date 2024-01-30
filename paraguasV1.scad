module rosca (){
    roscas=8;//
    giros=360*roscas;//
    tE=2;
    resRosca=3;

difference(){
for(i=[1:resRosca:giros]){
    rotate([0,0,i])
    translate([5,0,+i/240])
    scale([1,1,0.5])
    sphere(tE, $fn=5);
}
translate([0,0,11])//
cylinder(h=10,r=20,center=false, $fn=20);
translate([0,0,-10])
cylinder(h=10,r=20,center=false, $fn=20);

}

cylinder(h=1,r=8, $fn=120);
cylinder(h=11,r=4.5,center=false, $fn=120);
}


difference(){
translate([0,0,0.1])
cylinder(h=13,r=10, $fn=100);
    scale([1.05,1.05,1.05])
rosca();
}