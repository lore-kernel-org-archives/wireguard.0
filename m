Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cf08b15
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 07:17:22 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f79a016
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Feb 2018 07:17:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 7918320BA8
 for <wireguard@lists.zx2c4.com>; Mon, 12 Feb 2018 02:23:56 -0500 (EST)
Message-Id: <1518420236.1268661.1267596392.738A262C@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_151842023612686610"
Date: Mon, 12 Feb 2018 20:23:56 +1300
Subject: Starcraft over Wireguard ... :sideeye:
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_151842023612686610
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

Hi, awesome WG mailinglist!

My 18 year-old has recently moved out of home, and we're starting to
yearn for one of our traditional Starcraft matches.  I thought I should
be able to do this easily with Wireguard.
The idea, generally, is that one of us would start up a game, and
Wireguard - with a side serving of ProxyARP and IP forwarding - would
help make all the other computers see that game.  (or, at very worst,
allow me to run a game that could be seen by his computer AND the other
computers here).
-=-=-=-=-=-=-=-=-=-=-=-=-

On his computer:  (LAN IP 192.168.1.x)

> [Interface]
> PrivateKey = {blah}=
> ListenPort = 12457
> Address = 192.168.88.3/24
> 
> [Peer]
> PublicKey = {blah2}=
> Endpoint = {my home}:12457
> AllowedIPs = 0.0.0.0/0
> 

On my computer:  (LAN IP 192.168.88.x)

> [Interface]
> PrivateKey = {blah3}=
> ListenPort = 12457
> Address = 192.168.88.2/32
> 
> [Peer]
> PublicKey = {blah4}=
> AllowedIPs = 192.168.88.3/32

-=-=-=-=-=-=-=-=-=-=-=-=-

But it turns out not to be so easy.  Starcraft sets up games over UDP
5353 and UDP 6112, and originally I thought it was a problem with
forwarding UDP packets.  However, I can see packets coming over the
tunnel from his computer, but the packets are being forwarded to an
address I don't know:
> root@me:~# tcpdump -i home port 5353 or port 6112
> tcpdump: verbose output suppressed, use -v or -vv for full
> protocol decode> listening on home, link-type RAW (Raw IP), capture size 262144 bytes
> 20:02:35.744726 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP,
> length 10> 20:02:35.759142 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP,
> length 10> 20:02:35.759157 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP,
> length 10> 20:02:36.045323 IP 37.244.23.109.3478 > 192.168.88.3.6112: UDP,
> length 19> 20:02:36.099993 IP 37.244.23.109.3478 > 192.168.88.3.6112: UDP,
> length 19> 20:02:36.100005 IP 37.244.23.109.3478 > 192.168.88.3.6112: UDP,
> length 19> 20:03:05.964077 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP,
> length 10> 20:03:05.964118 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP,
> length 10> 20:03:05.987761 IP 192.168.88.3.6112 > 37.244.23.109.3478: UDP,
> length 10
Any ideas where I can start looking?  I get similar behaviour whether I
host the game on my computer or on his.
Thanks in advance for any help you guys can offer!

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es



--_----------=_151842023612686610
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div>Hi, awesome WG mailinglist!<br></div>
<div><br></div>
<div>My 18 year-old has recently moved out of home, and we're starting to yearn for one of our traditional Starcraft matches.&nbsp; I thought I should be able to do this easily with Wireguard.<br></div>
<div><br></div>
<div><div>The idea, generally, is that one of us would start up a game, and Wireguard - with a side serving of ProxyARP and IP forwarding - would help make all the other computers see that game.&nbsp; (or, at very worst, allow me to run a game that could be seen by his computer AND the other computers here).<br></div>
<div><br></div>
</div>
<div>-=-=-=-=-=-=-=-=-=-=-=-=-<br></div>
<div><br></div>
<div>On his computer:&nbsp; (LAN IP 192.168.1.x)<br></div>
<div><br></div>
<blockquote type="cite"><div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">[Interface]<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">PrivateKey = {blah}=<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">ListenPort = 12457<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">Address = 192.168.88.3/24<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">[Peer]<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">PublicKey = {blah2}=<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">Endpoint = {my home}:12457<br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">AllowedIPs = 0.0.0.0/0<br></span></div>
<div><br></div>
</blockquote><div><br></div>
<div>On my computer:&nbsp; (LAN IP 192.168.88.x)<br></div>
<div><br></div>
<blockquote type="cite"><div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">[Interface]</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">PrivateKey = {blah3}=</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">ListenPort = 12457</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">Address = 192.168.88.2/32</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">[Peer]</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">PublicKey = {blah4}=</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">AllowedIPs = 192.168.88.3/32</span><br></div>
</blockquote><div><br></div>
<div>-=-=-=-=-=-=-=-=-=-=-=-=-<br></div>
<div><br></div>
<div>But it turns out not to be so easy.&nbsp; Starcraft sets up games over UDP 5353 and UDP 6112, and originally I thought it was a problem with forwarding UDP packets.&nbsp; However, I can see packets coming over the tunnel from his computer, but the packets are being forwarded to an address I don't know:</div>
<div><br></div>
<blockquote type="cite"><div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">root@me:~# tcpdump -i home port 5353 or port 6112</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">tcpdump: verbose output suppressed, use -v or -vv for full protocol decode</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">listening on home, link-type RAW (Raw IP), capture size 262144 bytes</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:02:35.744726 IP 192.168.88.3.6112 &gt; 37.244.23.109.3478: UDP, length 10</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:02:35.759142 IP 192.168.88.3.6112 &gt; 37.244.23.109.3478: UDP, length 10</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:02:35.759157 IP 192.168.88.3.6112 &gt; 37.244.23.109.3478: UDP, length 10</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:02:36.045323 IP 37.244.23.109.3478 &gt; 192.168.88.3.6112: UDP, length 19</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:02:36.099993 IP 37.244.23.109.3478 &gt; 192.168.88.3.6112: UDP, length 19</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:02:36.100005 IP 37.244.23.109.3478 &gt; 192.168.88.3.6112: UDP, length 19</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:03:05.964077 IP 192.168.88.3.6112 &gt; 37.244.23.109.3478: UDP, length 10</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:03:05.964118 IP 192.168.88.3.6112 &gt; 37.244.23.109.3478: UDP, length 10</span><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;"><br></span></div>
<div><span class="font" style="font-family: menlo, consolas, monospace, sans-serif;">20:03:05.987761 IP 192.168.88.3.6112 &gt; 37.244.23.109.3478: UDP, length 10</span><br></div>
</blockquote><div><br></div>
<div>Any ideas where I can start looking?&nbsp; I get similar behaviour whether I host the game on my computer or on his.<br></div>
<div><br></div>
<div>Thanks in advance for any help you guys can offer!<br></div>
<div><br></div>
<div>E</div>
<div><br></div>
<div id="sig66226376"><div class="signature">--------------------------------------------<br></div>
<div class="signature">Q: Why is this email five sentences or less?<br></div>
<div class="signature">A: http://five.sentenc.es<br></div>
<div class="signature"><br></div>
</div>
<div><br></div>
</body>
</html>

--_----------=_151842023612686610--
