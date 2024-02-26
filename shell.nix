{
  nixpkgs ? <nixpkgs>,
  pkgs ? import nixpkgs { }
}:
with pkgs;
mkShell {
  # Meson is no longer able to pick up Boost automatically.
  # https://github.com/NixOS/nixpkgs/issues/86131
  BOOST_INCLUDEDIR = "${lib.getDev boost}/include";
  BOOST_LIBRARYDIR = "${lib.getLib boost}/lib";

  nativeBuildInputs = [ meson ninja pkg-config wayland-scanner wayland-protocols ];
  buildInputs = [ libev opencl-headers ocl-icd boost wayland ];
}
