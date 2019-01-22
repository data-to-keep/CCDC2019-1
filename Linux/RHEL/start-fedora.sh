### Starter script

useradd alfonzo
echo "cyberdragons" | passwd alfonzo --stdin
usermod -aG wheel alfonzo

useradd sam
echo "cyberdragons" | passwd sam --stdin
usermod -aG wheel sam

useradd colbert
echo "cyberdragons" | passwd colbert --stdin
usermod -aG wheel colbert

useradd nick
echo "cyberdragons" | passwd nick --stdin
usermod -aG wheel nick

sudo passwd -l root
sudo passwd -d root

### Password Changes

for i in $( cat /etc/passwd | awk -F: '$3 > 999 {print $1}' ); do
	echo -e "cyberdragons\ncyberdragons" | passwd $i
done

### Wheel Changes

grep '^wheel:.*$' /etc/group | cut -d: -f4 | sed "s/,/\n/g" > wheel.bk

for i in $(grep '^wheel:.*$' /etc/group | cut -d: -f4 | sed "s/,/\n/g"); do
	if [ "$i" = "alfonzo" ] ; then
		continue
	elif [ "$i" = "sam" ] ; then
		continue
	elif [ "$i" = "nick" ] ; then
		continue
	elif [ "$i" = "colbert" ] ; then
		continue
	else
		gpasswd -d $i wheel
	fi
done

### No login

cat /etc/passwd | awk -F: '$7 != "/usr/sbin/nologin" {print $1}' > bash.bk

for i in $( cat /etc/passwd | awk -F: '$7 != "/usr/sbin/nologin" {print $1}' ); do
  if [ "$i" = "alfonzo" ] ; then
    continue
  elif [ "$i" = "sam" ] ; then
    continue
  elif [ "$i" = "nick" ] ; then
    continue
  elif [ "$i" = "colbert" ] ; then
    continue
  elif [ "$i" = "root" ] ; then
    continue
  else
    usermod -s /usr/sbin/nologin $i
  fi
done

## Tools

sudo yum upgrade -y
sudo yum update -y
sudo yum install vim -y
