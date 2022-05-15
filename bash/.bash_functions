# mkdir and cd
function mc(){
    mkdir -p "$@" &&
    cd $_;
}
