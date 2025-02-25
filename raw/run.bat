echo ::Generating scene octree::
oconv mat.rad geo.rad sunLights.rad > scene.oct

echo ::Running rcontrib for direct sun::
rcontrib -c 1000 -I+ -V+ -ab 0 -y 1 -t 5 -dc 1 -dt 0 -dj 0.9 -faa -M sunNames.txt scene.oct < sensors.txt > dir.mtx

echo ::Converting direct sun results to illuminance::
rmtxop -faa -c 0.265 0.670 0.065 -t dir.mtx > dirFin.txt

echo ::Simulation(s) complete::