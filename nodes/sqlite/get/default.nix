{ agent, edges, crates, pkgs }:

agent {
  src = ./.;
  edges = with edges; [ generic_text path ];
  crates = with crates; [];
  osdeps = with pkgs; [ sqlite pkgconfig ];
  depsSha256 = "05398m69cq1pb4463h2pdmjz09f83fn3bxq5l6r1azaig933ybqq";
}
