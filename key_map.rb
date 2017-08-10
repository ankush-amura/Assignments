def key_map(key=1) #maps the keypress on   keyboard to corresponding speacial characters
  return  if(key==nil) #returns if nil is passed on method
 hash_key={1=>'!',2=>'@',3=>'#',4=>'$',5=>'%',6=>'^',7=>'&',8=>'*',9=>'('} #hash declared for each char mapping
 return hash_key[key]   #resturn the value to the caller
end

p key_map(nil)
