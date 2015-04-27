(
  setxkbmap -layout es &&
  xmodmap ~/.Xmodmap &
) &

xrdb -load ~/.Xresources &
numlockx &

exec i3
