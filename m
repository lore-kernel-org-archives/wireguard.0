Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDF0C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E6B92085A
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 10:02:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mail.com header.i=@mail.com header.b="BQa36cla"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E6B92085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9fad1dec;
	Fri, 1 Mar 2019 09:52:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14f93a53
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Feb 2019 17:44:51 +0000 (UTC)
Received: from mout.gmx.com (mout.gmx.com [74.208.4.200])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a83ad70
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Feb 2019 17:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
 s=dbd5af2cbaf7; t=1551117250;
 bh=Xu/UyBAZNDRRuMfSKxqJV++XiCYJPWWCmGvAnfM56XI=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=BQa36clam0f5YDu34/tgyFpEBfF+xeqF0JqcvySY/Yz5cO6WkjQD7bqtofPbxdtxo
 nCP9EK1Lgff4lvhCpqPN/Em9FFl3lCnMDJkeCefIB0llSehRQslUE8vb6VeK6h0Xzg
 pP5ErppwjIXS60mU/7JQ+3pc7AytSLj22t50tXf0=
X-UI-Sender-Class: 214d933f-fd2f-45c7-a636-f5d79ae31a79
Received: from [24.9.28.138] ([24.9.28.138]) by web-mail.mail.com
 (3c-app-mailcom-lxa02.server.lan [10.76.45.3]) (via HTTP); Mon, 25 Feb 2019
 18:54:10 +0100
MIME-Version: 1.0
Message-ID: <trinity-3d5ffcff-d0f4-4dbf-8251-b8e8a61f4188-1551117250850@3c-app-mailcom-lxa02>
From: "Henry Schaffer" <henrysch@mail.com>
To: wireguard@lists.zx2c4.com
Subject: WireGuard on OpenBSD help
Date: Mon, 25 Feb 2019 18:54:10 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:teAeQHO+w72cd3n38ScEvxgDyvS/MLDeZGodBjPQ3OXp10VfE7daPqFxfzTf/Er9r14qj
 ZOQSQkT0GQGkRfXxsTNcy1p+fU9dTyL1RgHjGipfDKYBx9fGf+N+K3CQsGV+R8Ef+VFAB4J/YDSH
 EGh1IoSbdPO2fKDw9lFkpX4Q0BJpCcvqO6bCkri0TcSvWCFPmpoUZv1gzEQTwjhdBlv94PrxL618
 12K5cySfbUvkcQiTY5SEBaUlevMbCR5qBO0zE9HgFdAIXnDPcp7Hm8ePsZ+65ngGqvhZPADK/qXr
 n0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:6eg7oj1exwM=:I3GnLaNHJcE+rrefu3HgKl
 2EGdjXnLpr1WO7BWQ5d9+1/Ut9Kbs0O0TfRL9EE2jvu1IfBhoPjPOFaXirOW0CNt8vbu/j7tf
 FtFroK7D/aCdlN53DF1zsOIkh4VDxpyDjKY5MCbRrhj4nzlJTmzQZ1UWZt0cvacxn+H8mW0ZX
 E4jQ6OmmBgMBPJENf7nd9VdUNpElzdbUmLwJmqGtHgPYUMwqulMBpnsfOktX5VP4LLBWmp1aL
 6gt2/n6xC2ITuqeIpN1ByyldBbjiFMn1Zz54wkGshl7Tu7YwbWDwS5+0E7BBdnJcXJuWD0+vE
 tAovHxt5ytwJ+oMsa6+iJOYzFJfEb56FFMIuWTHFkjZvd15AprHaNEBcKfUkBBI952OpkCeDV
 L0bv7E9IzRdMbrQ7njmCGIqjUF/vQyoRn+UHgrMCoSObfCmYH6XbcaUxsBNHxFHg5iBj+DNz1
 cTMngIcx/XeozQBjHczkoRtOaM2yorv1kxAaoVuCcrtX2AJnK86xRHbYXnPUxb1QEcIC5GuCH
 gOWwnebOwtuUvzXAeoPwyYhfsvc4zInwtZU6Uq3WcK65/AcoOlAYMsxx+wRHAPDVf/JvLwCXH
 7ck8n3CJThjb8=
X-Mailman-Approved-At: Fri, 01 Mar 2019 10:52:31 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1095003838589070446=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1095003838589070446==
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hello,</div>

<div>&nbsp;</div>

<div>I&#39;ve been unsuccesful getting WireGuard running on OpenBSD.&nbsp;Any help?&nbsp;I&#39;m trying to create a VPN from my desktop computer to a VPS. Both endpoints are OpenBSD 6.4 amd64.&nbsp;Here&#39;s what I&#39;ve done:</div>

<div>&nbsp;</div>

<div>
<div>vps# cd /usr/local/src/<br/>
vps# git clone https://git.zx2c4.com/wireguard-go<br/>
vps# git clone https://git.zx2c4.com/WireGuard</div>

<div>vps# cd wireguard-go<br/>
vps# gmake<br/>
vps# sed -i &#39;s/install -v/install/g&#39; Makefile<br/>
vps# gmake install<br/>
vps# cd ../WireGuard/src/tools/<br/>
vps# gmake<br/>
vps# sed -i &#39;s/install -v/install/g&#39; Makefile<br/>
vps# gmake install</div>

<div>&nbsp;</div>
</div>

<div>
<div>vps# cd /dev<br/>
vps# sh MAKEDEV tun4<br/>
vps# ifconfig tun4 create<br/>
vps# ifconfig tun4 up 10.99.0.1 10.99.0.2 netmask 255.255.255.0</div>

<div>&nbsp;</div>

<div>
<div>vps# sysctl net.inet.ip.forwarding=1<br/>
net.inet.ip.forwarding: 1 -&gt; 1</div>

<div>vps# cat /etc/pf.conf<br/>
pass in<br/>
pass out<br/>
pass out on egress inet from (tun4:network) nat-to (egress:0)<br/>
vps# pfctl -f /etc/pf.conf<br/>
&nbsp;</div>

<div>vps# mkdir /etc/wireguard<br/>
vps# chmod 700 /etc/wireguard/<br/>
vps# cd /etc/wireguard/<br/>
vps# wg genkey &gt; secret.key<br/>
Warning: writing to world accessible file.<br/>
Consider setting the umask to 077 and trying again.<br/>
vps# chmod 600 secret.key<br/>
vps# wg pubkey &lt; secret.key &gt; public.key<br/>
&nbsp;</div>

<div>
<div>vps# cat server.conf<br/>
[Interface]<br/>
PrivateKey = redacted<br/>
ListenPort = 9812</div>

<div>&nbsp;</div>

<div>[Peer]<br/>
PublicKey = 307HGI9N5etOjrKH+twPD55MzEtjB+50QMqBGZ0d73I=<br/>
AllowedIPs = 10.99.0.2/32</div>

<div>&nbsp;</div>

<div>vps# ifconfig tun4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<br/>
tun4: flags=8051&lt;UP,POINTOPOINT,RUNNING,MULTICAST&gt; mtu 1420<br/>
&nbsp; &nbsp; &nbsp; &nbsp; index 5 priority 0 llprio 3<br/>
&nbsp; &nbsp; &nbsp; &nbsp; groups: tun<br/>
&nbsp; &nbsp; &nbsp; &nbsp; status: active<br/>
&nbsp; &nbsp; &nbsp; &nbsp; inet 10.99.0.1 --&gt; 10.99.0.2 netmask 0xffffff00<br/>
&nbsp;</div>

<div>
<div>vps# wireguard-go tun4<br/>
vps# wg setconf tun4 server.conf<br/>
vps# wg<br/>
interface: tun4<br/>
&nbsp; public key: 1xUDhXJyaWP2vYwssSUV/CTzQbx0sQ0hrnDiDAx/lx4=<br/>
&nbsp; private key: (hidden)<br/>
&nbsp; listening port: 9812</div>

<div>peer: 307HGI9N5etOjrKH+twPD55MzEtjB+50QMqBGZ0d73I=<br/>
&nbsp; allowed ips: 10.99.0.2/32<br/>
&nbsp;</div>

<div>On the desktop, I built and installed the software the exact same as above.&nbsp;I created the tun4 interface, created WireGuard keys, etc., all as above. Some details:</div>

<div>&nbsp;</div>

<div>desktop# cd /etc/wireguard</div>

<div>
<div>desktop# cat client.conf &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/>
[Interface]<br/>
PrivateKey = redacted</div>

<div>&nbsp;</div>

<div>[Peer]<br/>
PublicKey =&nbsp;1xUDhXJyaWP2vYwssSUV/CTzQbx0sQ0hrnDiDAx/lx4=<br/>
Endpoint = 192.0.2.1:9812<br/>
AllowedIPs = 0.0.0.0/0</div>

<div>&nbsp;</div>

<div>desktop# ifconfig tun4 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<br/>
tun4: flags=8051&lt;UP,POINTOPOINT,RUNNING,MULTICAST&gt; mtu 1420<br/>
&nbsp; &nbsp; &nbsp; &nbsp; index 8 priority 0 llprio 3<br/>
&nbsp; &nbsp; &nbsp; &nbsp; groups: tun<br/>
&nbsp; &nbsp; &nbsp; &nbsp; status: active<br/>
&nbsp; &nbsp; &nbsp; &nbsp; inet 10.99.0.2 --&gt; 10.99.0.1 netmask 0xffffff00<br/>
&nbsp;</div>

<div>desktop#&nbsp;wireguard-go tun4</div>

<div>desktop#&nbsp;wg setconf tun4 client.conf</div>

<div>desktop# wg
<div>interface: tun4<br/>
&nbsp; public key: 307HGI9N5etOjrKH+twPD55MzEtjB+50QMqBGZ0d73I=<br/>
&nbsp; private key: (hidden)<br/>
&nbsp; listening port: 27512</div>

<div>peer: 1xUDhXJyaWP2vYwssSUV/CTzQbx0sQ0hrnDiDAx/lx4=<br/>
&nbsp; endpoint: 192.0.2.1:9812<br/>
&nbsp; allowed ips: 0.0.0.0/0<br/>
&nbsp;</div>
</div>

<div>Traffic is not passing over the VPN. Am I missing a pf rule or route command? Or something else?</div>

<div>&nbsp;</div>

<div>Henry</div>
</div>
</div>
</div>
</div>
</div></div></body></html>

--===============1095003838589070446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1095003838589070446==--
