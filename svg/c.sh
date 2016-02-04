for x in *.svg;
do 
  y=`basename $x svg`
  z="/tmp/${y}png"
  w="../docs/images/${y}png"
  `convert $x $z`
  if [ -e "$z" ] ; then
      `cp -i $z $w`
  fi
done
