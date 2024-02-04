anchoPalmar=95;
radioAgarre=25;
curvatura=7;
alturaMuesca=1;
girosMuesca=360*alturaMuesca;
tM=0.8;// tamaño de la muesca
resMuesca=2;
//n=40;
//r1=20;

module rosca (){
    pasos=8;//
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
    cylinder(h=11,r=4.5,center=false, $fn=10);
}

module muesca(){
for(i=[1:resMuesca:girosMuesca]){
    for(j=[0:15:360]){
    rotate([0,0,j+i])
    translate([radioAgarre,0,i/3.8])
    //sphere(tM, $fn=5);
                cube(tM, center=true);
    rotate([0,0,j-i])
    translate([radioAgarre,0,i/3.8])
    //sphere(tM, $fn=4);
                cube(tM, center=true);
    }
}
}
//agujero para la rosca
difference(){
cylinder(h=anchoPalmar,r=radioAgarre-curvatura);
translate([0,0,-0.1])
scale([1.05,1.05,1.05])
rosca();
}
// toro inferior
translate([0,0,curvatura])
rotate_extrude(angle=360, $fn=100)
translate([radioAgarre-curvatura,0,0])
circle(curvatura, $fn=100);
//toro superior
translate([0,0,anchoPalmar-curvatura])
rotate_extrude(angle=360, $fn=100)
translate([radioAgarre-curvatura,0,0])
circle(curvatura, $fn=100);
// cilindro entre toros con muesca
difference(){
translate([0,0,curvatura])
cylinder(h=anchoPalmar-(curvatura*2),r=radioAgarre);
muesca();
}
