anchoPalmar=95;
aP=anchoPalmar/2;


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
translate([0,0,aP])
scale([0.7,0.7,1])
sphere(aP,$fn=15);
rosca();
}


