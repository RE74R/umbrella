anchoPalmar=90;
radioAgarre=16;
curvatura=2;
alturaMuesca=1;
girosMuesca=360*alturaMuesca;
tM=0.8;// tamaño de la muesca
resMuesca=2;
n=20;
//r1=20;

module rosca (){
    pasos=10;//
    giros=360*pasos;//
    tE=2;
    resRosca=3;//+1 baja la calidad
    for(i=[1:resRosca:giros]){
    rotate([0,0,i])
    translate([5,0,+i/240])
    scale([1,1,0.5])
    sphere(tE, $fn=5);
    }
    cylinder(h=1,r=8, $fn=72);// encuentro
    cylinder(h=14.3,r=4.5,center=false, $fn=10);
}

//agujero para la rosca

module muesca(){
    for(i=[0:n-1]){
        rotate([0,0,360*i/n]){
        translate([radioAgarre,0,0])
        sphere(1);
        translate([radioAgarre,0,anchoPalmar-10])
        sphere(1);
        translate([radioAgarre,0,0])
        cylinder(h=anchoPalmar-10, r=1);
    }}
    
}



difference(){
cylinder(h=anchoPalmar-curvatura,r=radioAgarre, $fn=15);
translate([0,0,-0.1])
scale([1.05,1.05,1.05])
rosca();
muesca();
}

translate([0,0,-10])
difference(){
    cylinder(h=anchoPalmar+10-curvatura,r=radioAgarre, $fn=100);
    translate([0,0,-0.1])
    cylinder(h=anchoPalmar,r=radioAgarre-2);
    translate([0,0,10])
    muesca();
}

translate([0,0,-10])
difference(){
    cylinder(h=4,r=radioAgarre+2,$fn=100);
    translate([0,0,-0.1])
    cylinder(h=10,r=radioAgarre,$fn=10);
    translate([0,0,4])
    rotate_extrude(angle=360, $fn=100)
    translate([18,0,0])
    circle(2, $fn=100);
}

//toro superior
translate([0,0,anchoPalmar-curvatura])
rotate_extrude(angle=360, $fn=100)
translate([radioAgarre-curvatura,0,0])
circle(curvatura, $fn=100);
translate([0,0,anchoPalmar-curvatura])
cylinder(h=curvatura, r=radioAgarre-curvatura);
