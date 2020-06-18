Return-Path: <SRS0=P8C1=77=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBC3CC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 04:31:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06FC721852
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Jun 2020 04:31:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=xirihosting.com header.i=@xirihosting.com header.b="DLeMuVwf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06FC721852
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xirihosting.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 575a0fc6;
	Thu, 18 Jun 2020 04:13:23 +0000 (UTC)
Received: from smtp119.iad3a.emailsrvr.com (smtp119.iad3a.emailsrvr.com
 [173.203.187.119])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id dc2f7c1b
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jun 2020 04:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xirihosting.com;
 s=20180223-h43bbanu; t=1592454690;
 bh=IuPzO5AbQdz5/gbzUQ4Fk53F6jDJVIooX0yR7cwKt5w=;
 h=Date:Subject:From:To:From;
 b=DLeMuVwfEppZySX5G6BD/ze16+IJV9or3n5Q7lQVVCNkTgQdnYmyugIr2h+YsyMNb
 KOdazy+a6pKpp52UKUJjEEfImrbcev8tovQMTl9DCUPP+YhvdZIn4UiK2kReL/TAuL
 5ACY9vtH9mRPeTGT4EI5MEcESZIICxhdxB6mEoZM=
Received: from app67.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140])
 by smtp31.relay.iad3a.emailsrvr.com (SMTP Server) with ESMTP id 5B35F2101B;
 Thu, 18 Jun 2020 00:31:30 -0400 (EDT)
X-Sender-Id: dxiri@xirihosting.com
Received: from app67.wa-webapps.iad3a (relay-webapps.rsapps.net
 [172.27.255.140]) by 0.0.0.0:25 (trex/5.7.12);
 Thu, 18 Jun 2020 00:31:30 -0400
Received: from xirihosting.com (localhost.localdomain [127.0.0.1])
 by app67.wa-webapps.iad3a (Postfix) with ESMTP id 38E82601E2;
 Thu, 18 Jun 2020 00:31:30 -0400 (EDT)
Received: by webmail.emailsrvr.com
 (Authenticated sender: dxiri@xirihosting.com, from: dxiri@xirihosting.com) 
 with HTTP; Thu, 18 Jun 2020 00:31:30 -0400 (EDT)
X-Auth-ID: dxiri@xirihosting.com
Date: Thu, 18 Jun 2020 00:31:30 -0400 (EDT)
Subject: Re: Kernel Panic after updating Kernel
From: "dxiri@xirihosting.com" <dxiri@xirihosting.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "WireGuard mailing list" <wireguard@lists.zx2c4.com>,
 "ElRepo" <contact@elrepo.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Importance: Normal
X-Priority: 3 (Normal)
X-Type: plain
In-Reply-To: <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
References: <1592249458.376720421@webmail.emailsrvr.com> 
 <CAHmME9oz5tt9u5S3V6JikvB3oGihXR5rcZTLvcjxNu4qnvWCOw@mail.gmail.com>
Message-ID: <1592454690.22771558@webmail.emailsrvr.com>
X-Mailer: webmail/17.3.12-RC
X-Classification-ID: 508253e4-a515-4d7d-af59-df9648ae92b3-1-1
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

-----Original Message-----=0AFrom: "Jason A. Donenfeld" <Jason@zx2c4.com>=
=0ASent: Wednesday, June 17, 2020 4:32am=0ATo: "dxiri@xirihosting.com" <dxi=
ri@xirihosting.com>=0ACc: "WireGuard mailing list" <wireguard@lists.zx2c4.c=
om>, "ElRepo" <contact@elrepo.org>=0ASubject: Re: Kernel Panic after updati=
ng Kernel=0A=0AHi Diego,=0A=0AOn Wed, Jun 17, 2020 at 2:01 AM dxiri@xirihos=
ting.com=0A<dxiri@xirihosting.com> wrote:=0A>=0A> Posted this on IRC but go=
t no response, probably this will be a better place:=0A>=0A> I updated my C=
entos7 server yesterday and wireguard is causing a kernel panic, wanted to =
know if this is a known issue?=0A>=0A> Using kernel 3.10.0-1127.10.1.el7.x8=
6_64=0A>=0A> I Tried with 2 different repos (elrepo and Copr repo for wireg=
uard owned by jdoss) and I have the same issue.=0A>=0A> I took a screenshot=
 of The kernel panic and uploaded at https://imgur.com/a/Ojxeor0=0A>=0A> An=
other interesting bit of info is that as long as I don't move traffic troug=
h wg0 vnic, no panic happens. I can easily trigger the panic by just doing =
a ping to the other VPN endpoint and I am able to reproduce this every sing=
le time.=0A>=0A> # lsmod | grep -i wire=0A> wireguard             200896  0=
=0A> ip6_udp_tunnel         12755  1 wireguard=0A> udp_tunnel             1=
4423  1 wireguard=0A>=0A> Thanks for the help!=0A> Diego=0A=0AHuh, that's f=
unny -- I'm unable to reproduce the bug at all.=0A=0ADoes running this scri=
pt crash for you?=0Ahttps://salsa.debian.org/debian/wireguard-linux-compat/=
-/raw/debian/master/debian/tests/netns-mini=0A=0AIf not, could you describe=
 your setup more and maybe some repro steps for me?=0A=0AThanks,=0AJason=0A=
=0A--------------------=0A=0AHi Jason, =0A=0ATried your script, here is the=
 result (spoiler...no crash):=0A=0Aroot@box [4542 22:04:00 /etc/wireguard]#=
 bash netns-mini-test.sh=0A[+] ip netns add wg-test-36633-0=0A[+] ip netns =
add wg-test-36633-1=0A[+] ip netns add wg-test-36633-2=0A[+] NS0: ip link s=
et up dev lo=0A[+] NS0: ip link add dev wg0 type wireguard=0A[+] NS0: ip li=
nk set wg0 netns wg-test-36633-1=0A[+] NS0: ip link add dev wg0 type wiregu=
ard=0A[+] NS0: ip link set wg0 netns wg-test-36633-2=0A[+] NS1: ip addr add=
 192.168.241.1/24 dev wg0=0A[+] NS2: ip addr add 192.168.241.2/24 dev wg0=
=0A[+] wg genkey=0A[+] wg genkey=0A[+] wg pubkey=0A[+] wg pubkey=0A[+] NS1:=
 wg set wg0 private-key /dev/fd/63 listen-port 1 peer 0zUBih0nFOHRDzl6mBxcH=
aCfwX+s9sE6rLgK4f8LdiU=3D allowed-ips 192.168.241.2/32=0A[+] NS2: wg set wg=
0 private-key /dev/fd/63 listen-port 2 peer jBLy+DQDc21/f5z9Yfz287FB/Z9PhaX=
vNdMw7WDoWFM=3D allowed-ips 192.168.241.1/32=0A[+] NS1: ip link set up dev =
wg0=0A[+] NS2: ip link set up dev wg0=0A[+] NS2: wg set wg0 peer jBLy+DQDc2=
1/f5z9Yfz287FB/Z9PhaXvNdMw7WDoWFM=3D endpoint 127.0.0.1:1=0A[+] NS2: ping -=
c 10 -f -W 1 192.168.241.1=0APING 192.168.241.1 (192.168.241.1) 56(84) byte=
s of data.=0A=0A--- 192.168.241.1 ping statistics ---=0A10 packets transmit=
ted, 10 received, 0% packet loss, time 1ms=0Artt min/avg/max/mdev =3D 0.054=
/0.159/0.884/0.243 ms, ipg/ewma 0.209/0.316 ms=0A[+] NS0: ip link del dev w=
g0=0A[+] NS1: ip link del dev wg0=0A[+] NS2: ip link del dev wg0=0A[+] ip n=
etns del wg-test-36633-1=0A[+] ip netns del wg-test-36633-2=0A[+] ip netns =
del wg-test-36633-0=0A=0AAbout my setup:=0A=0A1) KVM hosted VM=0A2) Using w=
g-quick, followed this tutorial: https://www.stavros.io/posts/how-to-config=
ure-wireguard/=0A3) CPanel v88.0.10 (as far as I know, CPanel does NOT modi=
fy stock Centos 7 kernel)=0A=0A4) root@box [4545 22:07:54 /etc/wireguard]# =
free -m=0A              total        used        free      shared  buff/cac=
he   available=0AMem:           2363        1373         174          12   =
      815         793=0ASwap:          1999        1637         362=0A=0A5)=
 root@box [4547 22:10:37 /etc/wireguard]# cat wg0.conf=0A[Interface]=0AAddr=
ess =3D 192.168.100.101/28=0APrivateKey =3D 0000000xxxxxxxpjdlkkljkljalkjlk=
jl=3D=0AListenPort =3D 11555=0A=0A[Peer]=0APublicKey =3D djkjadlkjlkjkldjlk=
jaslkjadlk=3D=0AAllowedIPs =3D 192.168.100.100/32=0AEndpoint =3D 1.1.1.1:11=
555=0A=0A6) Yum operations trigger a lot of exclutions for elrepo, but noth=
ing seems wireguard related:=0A=0ALoaded plugins: changelog, elrepo, fastes=
tmirror, priorities, tsflags, universal-hooks=0ALoading mirror speeds from =
cached hostfile=0A * EA4: 208.100.0.204=0A * cpanel-addons-production-feed:=
 208.100.0.204=0A * cpanel-plugins: 208.100.0.204=0A * elrepo: elrepo.0m3n.=
net=0A * epel: mirror.csis.ysu.edu=0A[elrepo]: excluding package: kmod-3c59=
x-0.0-3.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-8188eu-4.1.=
4_6773.20130222-4.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-8=
188eu-4.1.4_6773.20130222-5.el7_6.elrepo.x86_64=0A[elrepo]: excluding packa=
ge: kmod-8188eu-5.2.2.4-1.20190907git.el7_7.elrepo.x86_64=0A[elrepo]: exclu=
ding package: kmod-a2818-1.20-1.el7.elrepo.x86_64=0A[elrepo]: excluding pac=
kage: kmod-a3818-1.6.0-1.el7.elrepo.x86_64=0A[elrepo]: excluding package: k=
mod-a3818-1.6.2-1.el7_6.elrepo.x86_64=0A[elrepo]: excluding package: kmod-a=
acraid-1.2.1-5.el7.elrepo.x86_64=0A[elrepo]: excluding package: kmod-aic7xx=
x-7.0-3.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-ar5523-0.0-=
8.el7_6.elrepo.x86_64=0A[elrepo]: excluding package: kmod-ar5523-0.0-9.el7_=
7.elrepo.x86_64=0A[elrepo]: excluding package: kmod-ath5k-0.0-12.el7_7.elre=
po.x86_64=0A[elrepo]: excluding package: kmod-cassini-1.6-2.el7_5.elrepo.x8=
6_64=0A[elrepo]: excluding package: kmod-cciss-3.6.26-5.el7_5.elrepo.x86_64=
=0A[elrepo]: excluding package: kmod-cciss-3.6.26-6.el7_6.elrepo.x86_64=0A[=
elrepo]: excluding package: kmod-cciss-3.6.26-7.el7_7.elrepo.x86_64=0A[elre=
po]: excluding package: kmod-drbd84-8.4.11-1.el7_5.elrepo.x86_64=0A[elrepo]=
: excluding package: kmod-drbd84-8.4.11-1.1.el7_6.elrepo.x86_64=0A[elrepo]:=
 excluding package: kmod-drbd90-9.0.14-1.el7_5.elrepo.x86_64=0A[elrepo]: ex=
cluding package: kmod-drbd90-9.0.16-1.el7_6.elrepo.x86_64=0A[elrepo]: exclu=
ding package: kmod-drbd90-9.0.20-1.el7_7.elrepo.x86_64=0A[elrepo]: excludin=
g package: kmod-e100-3.5.24-3.el7_5.elrepo.x86_64=0A[elrepo]: excluding pac=
kage: kmod-ecryptfs-0.1-1.el7_6.elrepo.x86_64=0A[elrepo]: excluding package=
: kmod-forcedeth-0.64-3.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: =
kmod-fpga-mgr-0.0-1.el7_6.elrepo.x86_64=0A[elrepo]: excluding package: kmod=
-hfs-0.0-4.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-hfsplus-=
0.0-5.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-i2c-i801-0.0-=
4.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-i2c-i801-0.0-5.el=
7_6.elrepo.x86_64=0A[elrepo]: excluding package: kmod-i2c-i801-0.0-6.el7_6.=
elrepo.x86_64=0A[elrepo]: excluding package: kmod-ixgb-1.0.135-4.el7_5.elre=
po.x86_64=0A[elrepo]: excluding package: kmod-ixgbe-5.5.5-1.el7_6.elrepo.x8=
6_64=0A[elrepo]: excluding package: kmod-ixgbe-5.6.3-1.el7_7.elrepo.x86_64=
=0A[elrepo]: excluding package: kmod-ixgbe-5.6.3-2.el7_7.elrepo.x86_64=0A[e=
lrepo]: excluding package: kmod-joydev-0.0-4.el7_5.elrepo.x86_64=0A[elrepo]=
: excluding package: kmod-mt7601u-4.14.108-1.el7_6.elrepo.x86_64=0A[elrepo]=
: excluding package: kmod-mt7601u-4.14.108-2.el7_7.elrepo.x86_64=0A[elrepo]=
: excluding package: kmod-nct6775-0.0-4.20180327git.el7_5.elrepo.x86_64=0A[=
elrepo]: excluding package: kmod-nct6775-0.0-5.el7_7.elrepo.x86_64=0A[elrep=
o]: excluding package: kmod-ne2k-pci-1.03-4.el7_5.elrepo.x86_64=0A[elrepo]:=
 excluding package: kmod-netatop-0.3-4.el7_6.elrepo.x86_64=0A[elrepo]: excl=
uding package: kmod-netatop-2.0-1.el7_6.elrepo.x86_64=0A[elrepo]: excluding=
 package: kmod-niu-1.1-2.el7_5.elrepo.x86_64=0A[elrepo]: excluding package:=
 kmod-nvidia-440.44-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding package: nv=
idia-x11-drv-libs-440.44-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding packag=
e: nvidia-x11-drv-libs-440.44-1.el7_7.elrepo.i686=0A[elrepo]: excluding pac=
kage: nvidia-x11-drv-440.44-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding pac=
kage: kmod-nvidia-440.59-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding packag=
e: nvidia-x11-drv-libs-440.59-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding p=
ackage: nvidia-x11-drv-440.59-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding p=
ackage: nvidia-x11-drv-libs-440.59-1.el7_7.elrepo.i686=0A[elrepo]: excludin=
g package: kmod-nvidia-440.64-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding p=
ackage: nvidia-x11-drv-libs-440.64-1.el7_7.elrepo.x86_64=0A[elrepo]: exclud=
ing package: nvidia-x11-drv-libs-440.64-1.el7_7.elrepo.i686=0A[elrepo]: exc=
luding package: nvidia-x11-drv-440.64-1.el7_7.elrepo.x86_64=0A[elrepo]: exc=
luding package: kmod-nvidia-340xx-340.107-2.el7_6.elrepo.x86_64=0A[elrepo]:=
 excluding package: kmod-nvidia-340xx-340.107-3.el7_7.elrepo.x86_64=0A[elre=
po]: excluding package: kmod-nvidia-390xx-390.116-1.el7_6.elrepo.x86_64=0A[=
elrepo]: excluding package: nvidia-x11-drv-390xx-390.116-1.el7_6.elrepo.x86=
_64=0A[elrepo]: excluding package: nvidia-x11-drv-390xx-libs-390.116-1.el7_=
6.elrepo.x86_64=0A[elrepo]: excluding package: nvidia-x11-drv-390xx-libs-39=
0.116-1.el7_6.elrepo.i686=0A[elrepo]: excluding package: kmod-nvidia-390xx-=
390.116-2.el7_7.elrepo.x86_64=0A[elrepo]: excluding package: nvidia-x11-drv=
-390xx-libs-390.116-2.el7_7.elrepo.i686=0A[elrepo]: excluding package: nvid=
ia-x11-drv-390xx-390.116-2.el7_7.elrepo.x86_64=0A[elrepo]: excluding packag=
e: nvidia-x11-drv-390xx-libs-390.116-2.el7_7.elrepo.x86_64=0A[elrepo]: excl=
uding package: kmod-r8168-8.046.00-1.el7_5.elrepo.x86_64=0A[elrepo]: exclud=
ing package: kmod-r8168-8.047.04-1.el7_7.elrepo.x86_64=0A[elrepo]: excludin=
g package: kmod-r8168-8.047.05-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding =
package: kmod-r8168-8.048.00-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding pa=
ckage: kmod-r8169-6.020.00-3.el7_5.elrepo.x86_64=0A[elrepo]: excluding pack=
age: kmod-r8822be-0.0-1.el7_6.elrepo.x86_64=0A[elrepo]: excluding package: =
kmod-reiserfs-0.0-3.el7_6.elrepo.x86_64=0A[elrepo]: excluding package: kmod=
-rr62x-1.2-3.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-rr64xl=
-1.4.0-1.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-rtl8812au-=
5.3.4-1.el7_7.elrepo.x86_64=0A[elrepo]: excluding package: kmod-sis190-1.4-=
1.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-sis900-1.08.10-2.=
el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-sym53c8xx-0.0-4.el7=
_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-tpe-2.0.3-6.20170731gi=
t.el7_5.elrepo.x86_64=0A[elrepo]: excluding package: kmod-tpe-2.0.4-1.el7_7=
.elrepo.x86_64=0A[elrepo]: excluding package: kmod-typhoon-1.0-3.el7_5.elre=
po.x86_64=0A[elrepo]: excluding package: kmod-usbip-1.0.1-2.el7_5.elrepo.x8=
6_64=0A[elrepo]: excluding package: kmod-usbip-1.0.1-3.el7_6.elrepo.x86_64=
=0A[elrepo]: excluding package: kmod-usbip-1.0.1-4.el7_7.elrepo.x86_64=0A[e=
lrepo]: excluding package: kmod-via-rhine-1.5.1-3.el7_5.elrepo.x86_64=0A[el=
repo]: excluding package: kmod-via-velocity-1.15-2.el7_5.elrepo.x86_64=0A[e=
lrepo]: excluding package: kmod-xpad-0.0.6-7.el7_5.elrepo.x86_64=0A[elrepo]=
: excluding package: kmod-xpad-0.0.6-8.el7_6.elrepo.x86_64=0A[elrepo]: excl=
uding package: kmod-xpad-0.0.6-9.el7_7.elrepo.x86_64=0A[elrepo]: excluding =
package: kmod-zd1211rw-1.0-6.el7_5.elrepo.x86_64=0A[elrepo]: excluding pack=
age: kmod-zd1211rw-1.0-7.el7_7.elrepo.x86_64=0A178 packages excluded due to=
 repository priority protections=0A=0A7) I have another VM with another ser=
vice provider and have the exact same issue after updating. This other VM h=
as a free version of CPanel called DNSONLY, if you care to install to take =
a shot at reproducing: https://docs.cpanel.net/installation-guide/cpanel-dn=
sonly-installation/=0A=0AAny other info you need feel free to ask :)=0A=0AT=
hanks!=0ADiego=0A

