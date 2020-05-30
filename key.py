ob="{"
cb="}"


def indent(content, size=2):
    content_is_string = type(content) == str
    if content_is_string:
        content = content.split('\n')

    lines = []
    spaces = ' '*size
    for c in content:
        lines.append(spaces + c)

    return lines

def sc_fn1(tname, name, content):
    lines = []
    lines.append("{t} {n}{{".format(t=tname, n=name))
    lines.extend(indent(content,4))
    lines.append("}")
    return lines


def sc_fn2(tname, content):
    lines = []
    lines.append("{t}{{".format(t=tname))
    lines.extend(indent(content,4))
    lines.append("}")
    return lines


def sc_module(name, content):
    return sc_fn1('module', name, content)

def sc_difference(content):
    return sc_fn2('difference()', content)

def sc_union(content):
    return sc_fn2('union()', content)

def sc_render(content):
    return sc_fn2('render()', content)


def sc_translate(x,y,z,content):
    return sc_fn2('translate([{x},{y},{z}])'.format(x=x,y=y,z=z), content)

def sc_rotate(x,y,z,content):
    return sc_fn2('rotate([{x},{y},{z}])'.format(x=x,y=y,z=z), content)


key_spacing_x=19.05
key_spacing_y=19.05
key_base_x=19.05
key_base_y=20
key_hole_x=14.4
key_hole_y=14.4
key_hole_z=4
# def sc_key_hole(oversize=0):
#     lines = []
#     lines.append("cube([{x},{y},{z}], center=true);".format(x=key_base_x, y=key_base_y, z=key_hole_z))
#     lines.append("cube([{x},{y},{z}], center=true);".format(x=key_hole_x, y=key_hole_y, z=key_hole_z + 0.2))
#     lines = sc_difference(lines)
#     lines.append("translate([0,{x},0]) nipple();".format(x=key_hole_x/-2))
#     lines.append("translate([0,{x},0]) mirror([0,1,0]) nipple();".format(x=key_hole_x/2))
#     return sc_module('key_hole()',  lines )
#
#
#
# def sc_nipple(adjust=0):
#     nipple="""
#     translate ([0, 0, 0]) {{
#         hull () {{
#             translate ([0, 0, 0]) {{
#                 cube ([{x}, 0.1, {z}], center=true);
#             }}
#             translate ([0, {y}-0.1, {z}/5]) {{
#                cube ([{x}, 0.1, 0.5], center=true);
#            }}
#         }}
#     }}""".format(x=2.5,y=0.5+adjust,z=4)
#     return sc_module('nipple()', nipple.split('\n'))


def pattern_curve_element(x,y,z,r,c,d,d2,o,e=0):
    lines = []
    offset = -int(c/2)
    n=0
    for i in range(c):
        dd=(i+offset)*d
        if n==e:
            lines.append("rotate([0,{d2},0]) rotate([{d1},0,0]) translate([0,0,{r}]) {o};".format(x=key_hole_x/2,r=r,d1=dd,d2=d2,o=o))
        n+=1

#    lines.append("rotate([0,5,0]) translate([0,0,{r}]) {o}();".format(x=key_hole_x/2,r=r,o=o))
    return lines



def pattern_curve(x,y,z,r,c,d,d2,o):
    lines = []
    lines.append("k=$kk;")
    offset = -int(c/2)
    for i in range(c):
        dd=(i+offset)*d
        lines.append("rotate([0,{d2},0]) rotate([{d1},0,0]) translate([0,0,{r}]) {o};".format(x=key_hole_x/2,r=r,d1=dd,d2=d2,o=o))

#    lines.append("rotate([0,5,0]) translate([0,0,{r}]) {o}();".format(x=key_hole_x/2,r=r,o=o))
    return lines

def functions():
    lines=["use <functions.scad>;"]
    return lines

#XX='key_hole()'
#XX='key_stamp()'

def mstripr1(XX):
    return sc_module('strip_r1()',stripr1(XX))
def mstripr2(XX):
    return sc_module('strip_r2()',stripr2(XX))
def mstripr3(XX):
    return sc_module('strip_r3()',stripr3(XX))
def mstripr4(XX):
    return sc_module('strip_r4()',stripr4(XX))
def mstripr5(XX):
    return sc_module('strip_r5()',stripr5(XX))
def mstripr6(XX):
    return sc_module('strip_r6()',stripr6(XX))


def mstripl1(XX):
    return sc_module('strip_l1()',stripl1(XX))
def mstripl2(XX):
    return sc_module('strip_l2()',stripl2(XX))
def mstripl3(XX):
    return sc_module('strip_l3()',stripl3(XX))
def mstripl4(XX):
    return sc_module('strip_l4()',stripl4(XX))
def mstripl5(XX):
    return sc_module('strip_l5()',stripl5(XX))
def mstripl6(XX):
    return sc_module('strip_l6()',stripl6(XX))


def stripr1(XX):
    return sc_translate(0,0,0,  pattern_curve(0,0,0,-200,5,5.7,4,XX))

def stripr2(XX):
    return sc_translate(key_spacing_x-6.5,0,-2,  pattern_curve(0,0,0,-200,6,5.7,2,XX))

def stripr3(XX):
    return sc_translate(key_spacing_x*2-13,0,-5,  pattern_curve(0,0,0,-200,6,5.7,0,XX))

def stripr4(XX):
    return sc_translate(key_spacing_x*3-23,0,-3,  pattern_curve(0,0,0,-200,6,5.7,-3,XX))

def stripr5(XX):
    return sc_translate(key_spacing_x*4-33,0,-2,  pattern_curve(0,0,0,-200,6,5.7,-6,XX))

def stripr6(XX):
    return sc_translate(key_spacing_x*5-39.5,0,0,  pattern_curve(0,0,0,-200,6,5.7,-8,XX))


def stripl1(XX):
    return sc_translate(0,0,0,  pattern_curve(0,0,0,-200,5,5.7,-4,XX))

def stripl2(XX):
    return sc_translate(-key_spacing_x+6.5,0,-2,  pattern_curve(0,0,0,-200,6,5.7,-2,XX))

def stripl3(XX):
    return sc_translate(-key_spacing_x*2+13,0,-5,  pattern_curve(0,0,0,-200,6,5.7,0,XX))

def stripl4(XX):
    return sc_translate(-key_spacing_x*3+23,0,-3,  pattern_curve(0,0,0,-200,6,5.7,3,XX))

def stripl5(XX):
    return sc_translate(-key_spacing_x*4+33,0,-2,  pattern_curve(0,0,0,-200,6,5.7,6,XX))

def stripl6(XX):
    return sc_translate(-key_spacing_x*5+39.5,0,0,  pattern_curve(0,0,0,-200,6,5.7,8,XX))


def right_keyboard2():
    lines = []
    lines.extend(right_keyboard('key_blank()'))
    lines.extend(right_keyboard('key_stamp()'))
    return sc_difference(lines)
#    return lines

def right_keyboard(XX):
    lines = []
#    lines.extend(sc_translate(35, -10, -195, 'cube([120,120,20], center=true);'))
    lines.extend(stripr1(XX))
    lines.extend(stripr2(XX))
    lines.extend(stripr3(XX))
    lines.extend(stripr4(XX))
    lines.extend(stripr5(XX))
    lines.extend(stripr6(XX))
    lines = sc_union(lines)
    return lines

def left_keyboard(XX):
    lines = []
#    lines.extend(sc_translate(-35, -10, -195, 'cube([120,120,20], center=true);'))
    lines.extend(stripl1(XX))
    lines.extend(stripl2(XX))
    lines.extend(stripl3(XX))
    lines.extend(stripl4(XX))
    lines.extend(stripl5(XX))
    lines.extend(stripl6(XX))
    lines = sc_union(lines)
    return lines

def arrows(XX, padding=0):
    lines = []
    lines.append("k=$kk;")
#    lines.extend(sc_translate(0,-10,0, 'cube([60,50,20], center=true);'))

    radius=5.5

    lines.append("if (padding==1){")
    lines.extend(sc_translate(0, 0, 200, pattern_curve_element(0, 0, 0, -200, 8, radius, 0, XX, 8)))
    lines.extend(sc_translate(0, 0, 200, pattern_curve_element(0, 0, 0, -200, 8, radius, 0, XX, 7)))
    lines.extend(sc_translate(0, 0, 200, pattern_curve_element(0, 0, 0, -200, 6, radius, 0, XX, 6)))

    # lines.extend(sc_translate(-key_spacing_x*2,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,1)))
    # lines.extend(sc_translate(-key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,1)))
    # lines.extend(sc_translate(0,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,1)))
    # lines.extend(sc_translate(+key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,1)))
    # lines.extend(sc_translate(+key_spacing_x*2,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,1)))
    lines.append("}")



    lines.extend(sc_translate(0, 0, 200, pattern_curve_element(0, 0, 0, -200, 6, radius, 0, XX, 5)))

#    lines.extend(sc_translate(0,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,4)))
    lines.extend(sc_translate(-key_spacing_x/2,0,200, pattern_curve_element(0,0,0,-200,6,radius,0,XX,4)))
    lines.extend(sc_translate(key_spacing_x/2,0,200, pattern_curve_element(0,0,0,-200,6,radius,0,XX,4)))

    lines.extend(sc_translate(-key_spacing_x, 0, 200, pattern_curve_element(0, 0, 0, -200, 6, radius, 0, XX, 3)))
    lines.extend(sc_translate(0,0, 200, pattern_curve_element(0, 0, 0, -200, 6, radius, 0, XX, 3)))
    lines.extend(sc_translate(+key_spacing_x, 0, 200, pattern_curve_element(0, 0, 0, -200, 6, radius, 0, XX, 3)))

    lines.extend(sc_translate(-key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,radius,0,XX,2)))
    lines.extend(sc_translate(0,0,200, pattern_curve_element(0,0,0,-200,6,radius,0,XX,2)))
    lines.extend(sc_translate(+key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,radius,0,XX,2)))





    lines2 = sc_union(lines)

    lines = []
    if padding == 1:

        lines.extend(sc_translate(0,0,200, pattern_curve_element(0,0,0,-200,8,5.7,0,XX,7)))
        lines.extend(sc_translate(0,0,200, pattern_curve_element(0,0,0,-200,8,5.7,0,XX,7)))

        lines.extend(sc_translate(-key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,5)))
        lines.extend(sc_translate(+key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,5)))

        lines.extend(sc_translate(-key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,4)))
        lines.extend(sc_translate(+key_spacing_x,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,4)))

        lines.extend(sc_translate(-key_spacing_x, 0, 200, pattern_curve_element(0, 0, 0, -200, 6, 5.7, 0, XX, 3)))
        lines.extend(sc_translate(+key_spacing_x, 0, 200, pattern_curve_element(0, 0, 0, -200, 6, 5.7, 0, XX, 3)))

        lines.extend(sc_translate(-key_spacing_x*2,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,2)))
        lines.extend(sc_translate(+key_spacing_x*2,0,200, pattern_curve_element(0,0,0,-200,6,5.7,0,XX,2)))

    lines2.extend(sc_union(lines))
    return lines2

def arrows_tidy(XX, padding=0):
    lines = []
    return lines


def main():
    with open("scad/out.scad","w") as f:
        lines = []
        lines.extend(functions())
        s=94
        r=20
        a=15
        f.write('\n'.join(lines));f.write('\n');lines = []

        lines.extend(mstripr1('key($kk=k)'))
        lines.extend(mstripr2('key($kk=k)'))
        lines.extend(mstripr3('key($kk=k)'))
        lines.extend(mstripr4('key($kk=k)'))
        lines.extend(mstripr5('key($kk=k)'))
        lines.extend(mstripr6('key($kk=k)'))

        lines.extend(mstripl1('key($kk=k)'))
        lines.extend(mstripl2('key($kk=k)'))
        lines.extend(mstripl3('key($kk=k)'))
        lines.extend(mstripl4('key($kk=k)'))
        lines.extend(mstripl5('key($kk=k)'))
        lines.extend(mstripl6('key($kk=k)'))
        f.write('\n'.join(lines));        f.write('\n');        lines = []

        lines.extend(sc_module('centre(padding=0)', arrows('key($kk=k)')))
        f.write('\n'.join(lines));        f.write('\n');        lines = []


        lines.extend(sc_translate(0,18.0,-60,  sc_rotate(0,0,r, 'cube([160,100,100]);')))
        lines.extend(sc_translate(-150.5,73,-60,  sc_rotate(0,0,-r, 'cube([160,100,100]);')))
        lines = sc_union(lines)
        lines = sc_module('X()', lines)
        f.write('\n'.join(lines));
        f.write('\n');
        lines = []

        lines.extend(sc_translate(s,0,200,  sc_rotate(0,a,r, right_keyboard('key_blank()'))))
        lines.extend(sc_translate(-s,0,200,  sc_rotate(0,-a,-r, left_keyboard('key_blank()'))))
        lines.extend(sc_translate(0,-38,15,  sc_rotate(-3,00,0, arrows_tidy('key_blank()',1))))
        lines = sc_union(lines)

        lines.append('X();')
        lines = sc_difference(lines)

        lines = sc_module('base()', lines)

        f.write('\n'.join(lines));
        f.write('\n');
        lines = []

        # lines.extend(sc_translate(s,0,200,  sc_rotate(0,a,r, right_keyboard('key_blank_small()'))))
        # lines.extend(sc_translate(-s,0,200,  sc_rotate(0,-a,-r, left_keyboard('key_blank_small()'))))
        # lines.extend(sc_translate(0, -38, 15,  sc_rotate(-3,00,0, arrows('key_blank_small()',1))))
        # lines = sc_union(lines)
        # lines = sc_module('base_small()', lines)
        # f.write('\n'.join(lines));
        # f.write('\n');
        # lines = []

#        lines.extend(sc_translate(0,0,0, 'cube([300,200,44], center=true);'))


        lines.extend(sc_translate(s,0,200,  sc_rotate(0,a,r, right_keyboard('key_stamp()'))))
        lines.extend(sc_translate(-s,0,200,  sc_rotate(0,-a,-r, left_keyboard('key_stamp()'))))
        lines.extend(sc_translate(0,-38, 15,  sc_rotate(-3,0,0, arrows('key_stamp()'))))
        lines = sc_union(lines)
        lines = sc_module('base_stamp()', lines)

        f.write('\n'.join(lines));
        f.write('\n');
        lines = []


        lines.append('base();')
        lines.append('base_stamp();')
        lines = sc_difference(lines)


    #    lines.append("key_hole();")
        f.write('\n'.join(lines))

main()