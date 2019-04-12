Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,MIME_HTML_MOSTLY,MIME_QP_LONG_LINE,MSGID_FROM_MTA_HEADER,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C34C04AAD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 143A5206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:39:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XP7r8w8Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 143A5206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e0f4a5c8;
	Mon, 6 May 2019 20:39:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 315b8fe1
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 12:29:11 +0000 (UTC)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39a805d0
 for <wireguard@lists.zx2c4.com>;
 Fri, 12 Apr 2019 12:29:11 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id k14so10991125qtb.0
 for <wireguard@lists.zx2c4.com>; Fri, 12 Apr 2019 05:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:mime-version:thread-index:date:content-transfer-encoding
 :accept-language:thread-topic:from:message-id:to:content-language;
 bh=th7qG73urUnhMQn7SckOg6QZmDpuNVmrxA+72K99UuM=;
 b=XP7r8w8Y6XE4FKEo/FoG6XADIAbu+Ce5yNV/laOq2zDYuBAvn6rykciyXh4JsqEq/9
 btkkpULoic2S845RvDoRABr7Hzcoa51PH91mATqssjWpVufuISFLNWqZTTsoz2L0h8w2
 jnl8USIGFD3egA6tH8FnBY/oRp8DedWS0OggZpdqSCzT/kWUS8W2rAHCi6MEqD1JXU3L
 Pi9v6fgYXCXRQjpYjo1J0suuSeAU2oSwOLyhSDGa+CcN5WmeDjf8d3xhb7fDLwOeAEHa
 TqgQ/BNerulqallioEFYqmUWD+nacsRg42cPbI/BlxpdtVCktdenK/WstTCoQZcSQkPB
 6PQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:mime-version:thread-index:date
 :content-transfer-encoding:accept-language:thread-topic:from
 :message-id:to:content-language;
 bh=th7qG73urUnhMQn7SckOg6QZmDpuNVmrxA+72K99UuM=;
 b=jGmpQMoTS2RaYIDmGMhJyVDe/omF47IE2v/egBmfyS4DRqMa7rMxGX5835OzhkMfvF
 kTsLSI4AOW6W5T1JpCu5kY80lrVCxHfxvDgXT8IbO86I3FWtbCwQQCRZyEC4TG1vwf6l
 UxiN2V48y4SSXUg0LY12/6BtO+NsPNMrDd2gfg83V6GPt//2ObfjkyZgpJT54omFyrMx
 m0IkxCQ8EQbJyadlYR2eIfEniEEhPO9UM95N+rk6BFRjY7FWDc6ZV4Stj72k+xVSMJzm
 cWqpqR0ptqVHebflaSGf881pp7Cvb193SPokcLCea5Tud3zALM8I1gPPuI0tzJg3sHjp
 GSoA==
X-Gm-Message-State: APjAAAXmaDdNkSxIuDd6tsgQF/ZLl0ZhuvhZht8f25b4ohuqfYHxpFT8
 RkFJLltIwEDyp6bW2ipCl6zTPLk=
X-Google-Smtp-Source: APXvYqyZO3Gb3yPK8k90S7yyEji3cGf7nOBDCf9QuSYOAlLSpQp/5OwfYqq/gBRLIJ3wUQQj6n1Lqw==
X-Received: by 2002:ac8:234e:: with SMTP id b14mr46395674qtb.271.1555072149386; 
 Fri, 12 Apr 2019 05:29:09 -0700 (PDT)
Received: from ?IPv6:fd9d:bc11:4020::4? ([2604:a880:800:c1::10b:d001])
 by smtp.gmail.com with ESMTPSA id v4sm21280762qtq.94.2019.04.12.05.29.04
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Apr 2019 05:29:08 -0700 (PDT)
X-Ms-Tnef-Correlator: 
X-Ms-Exchange-Organization-Scl: -1
Subject: Transition from Wifi to T-Mobile LTE issues
X-Ms-Exchange-Organization-Recordreviewcfmtype: 0
X-Ms-Has-Attach: yes
Mime-Version: 1.0
Thread-Index: AQHU7ufD0tCsvuBerEinOoTh/TOTKA==
Date: Fri, 12 Apr 2019 08:29:03 -0400
Accept-Language: en-US
Thread-Topic: Transition from Wifi to T-Mobile LTE issues
X-Ms-Exchange-Messagesentrepresentingtype: 1
From: Moshe Siegel <moshesiegel@gmail.com>
Message-Id: <6ACEAF8E-FCEE-4FFF-9723-8C0D3FAAA66E@gmail.com>
X-Mailer: iPhone Mail (16F5129d)
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Language: en-US
Received: from BL0PR05MB5138.namprd05.prod.outlook.com ([52.96.19.5]) by
 smtp.gmail.com with ESMTPSA id b1sm6783855itd.12.2019.04.09.08.20.29 for
 <wireguard@lists.zx2c4.com> (version=TLS1_2
 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 08:20:29 -0700 (PDT)
X-Mailman-Approved-At: Mon, 06 May 2019 22:39:06 +0200
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
Content-Type: multipart/mixed; boundary="===============3342487397154918318=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============3342487397154918318==
Content-Transfer-Encoding: 7bit
Content-Type: multipart/alternative;
	boundary=Apple-Mail-2A7D87EA-5949-4369-92BA-FA6C9AE9BF7F
Content-Language: en-US


--Apple-Mail-2A7D87EA-5949-4369-92BA-FA6C9AE9BF7F
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Any thoughts on this:
Running T-Mobile Iphone XS, replicated on IOS 12.2 and 12.3 Beta 1 and Beta 2=

Algo VPN installed on Lightsail (IPv4 Only)
Vultr, Digital Ocean, and EC2 (IP4v and IPv6 both enabled)
Algo issue link - https://github.com/trailofbits/algo/issues/1385
=20
I=E2=80=99ve been using the IOS WG app since its release and in the past 7-1=
0 days, the VPN stops transitioning from WiFi to LTE when  disconnecting via=
 IOS control center or walking away from WiFi.  the WG app shows connected, b=
ut no traffics passes, once I restart the tunnel I=E2=80=99m able to connect=
. Prior to this, the transition worked.
=20
Logs and Screenshots below
=20
Logs using current Algo code on Lightsail=20
=E2=80=94-transition from WiFi to LTE =E2=80=94 via waking away from wifi.
=20
2019-04-07 21:12:12.673495: [NET] Network change detected with requiresConne=
ction route and interface order [en0, utun2, pdp_ip0, pdp_ip0]
2019-04-07 21:12:12.680611: [NET] DNS64: mapped 3.84.245.133 to itself.
2019-04-07 21:12:12.681644: [NET] UAPI: Transition to peer configuration
2019-04-07 21:12:12.682070: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating e=
ndpoint
2019-04-07 21:12:12.682388: [NET] Binding sockets to interface 8
2019-04-07 21:12:12.682680: [NET] Unable to bind v6 socket to interface:%!(E=
XTRA syscall.Errno=3Dinvalid argument)
2019-04-07 21:12:12.703063: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send d=
ata packet write udp4 0.0.0.0:53791->3.84.245.133:51820: sendto: network is u=
nreachable
2019-04-07 21:12:12.715650: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send d=
ata packet write udp4 0.0.0.0:53791->3.84.245.133:51820: sendto: network is u=
nreachable
2019-04-07 21:12:13.088433: [NET] Network change detected with satisfied rou=
te and interface order [pdp_ip0, utun2]
2019-04-07 21:12:13.122617: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send d=
ata packet write udp4 0.0.0.0:53791->3.84.245.133:51820: sendto: network is u=
nreachable
2019-04-07 21:12:13.134085: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send d=
ata packet write udp4 0.0.0.0:53791->3.84.245.133:51820: sendto: network is u=
nreachable
2019-04-07 21:12:13.135346: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send d=
ata packet write udp4 0.0.0.0:53791->3.84.245.133:51820: sendto: network is u=
nreachable
2019-04-07 21:12:13.251423: [NET] DNS64: mapped 3.84.245.133 to 2607:7700::2=
a:0:1:354:f585
2019-04-07 21:12:13.251890: [NET] UAPI: Transition to peer configuration
2019-04-07 21:12:13.252095: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating e=
ndpoint
2019-04-07 21:12:13.252255: [NET] Binding sockets to interface 2
2019-04-07 21:12:13.252389: [NET] Unable to bind v6 socket to interface:%!(E=
XTRA syscall.Errno=3Dinvalid argument)
2019-04-07 21:12:13.292057: [NET] peer(jDeN=E2=80=A6juhA) - Handshake did no=
t complete after 5 seconds, retrying
=20
=20
=E2=80=94-force tunnel restart=E2=80=94
=20
=20
Sending handshake initiation
2019-04-07 21:13:46.269371: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send h=
andshake initiation write udp6 [::]:53791->[2607:7700:0:2a:0:1:354:f585]:518=
20: sendto: no route to host
2019-04-07 21:13:47.018560: [NET] UAPI: Processing get operation
2019-04-07 21:13:47.657352: [NET] UAPI: Processing get operation
2019-04-07 21:13:47.673847: [NET] UAPI: Processing get operation
2019-04-07 21:13:48.675486: [NET] UAPI: Processing get operation
2019-04-07 21:13:49.675755: [NET] UAPI: Processing get operation
2019-04-07 21:13:50.043331: [APP] startDeactivation: Tunnel: Arkadia
2019-04-07 21:13:50.049399: [APP] Tunnel 'Arkadia' connection status changed=
 to 'disconnecting'
2019-04-07 21:13:50.373260: [NET] Stopping tunnel
2019-04-07 21:13:50.373977: [NET] Device closing
2019-04-07 21:13:50.374774: [NET] Routine: event worker - stopped
2019-04-07 21:13:50.376321: [NET] Routine: TUN reader - stopped
2019-04-07 21:13:50.376883: [NET] Routine: receive incoming IPv4 - stopped
2019-04-07 21:13:50.377108: [NET] Routine: receive incoming IPv6 - stopped
2019-04-07 21:13:50.377425: [NET] peer(jDeN=E2=80=A6juhA) - Stopping...
2019-04-07 21:13:50.377699: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequent=
ial receiver - stopped
2019-04-07 21:13:50.377929: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequent=
ial sender - stopped
2019-04-07 21:13:50.378133: [NET] Routine: encryption worker - stopped
2019-04-07 21:13:50.378316: [NET] Routine: encryption worker - stopped
2019-04-07 21:13:50.378477: [NET] Routine: encryption worker - stopped
2019-04-07 21:13:50.378631: [NET] Routine: encryption worker - stopped
2019-04-07 21:13:50.378834: [NET] Routine: handshake worker - stopped
2019-04-07 21:13:50.379012: [NET] Routine: encryption worker - stopped
2019-04-07 21:13:50.379178: [NET] Routine: decryption worker - stopped
2019-04-07 21:13:50.379337: [NET] Routine: encryption worker - stopped
2019-04-07 21:13:50.379498: [NET] Routine: decryption worker - stopped
2019-04-07 21:13:50.379649: [NET] Routine: decryption worker - stopped
2019-04-07 21:13:50.379812: [NET] Routine: decryption worker - stopped
2019-04-07 21:13:50.379968: [NET] Routine: decryption worker - stopped
2019-04-07 21:13:50.380118: [NET] Routine: handshake worker - stopped
2019-04-07 21:13:50.380271: [NET] Routine: handshake worker - stopped
2019-04-07 21:13:50.380540: [NET] Routine: handshake worker - stopped
2019-04-07 21:13:50.380771: [NET] Routine: handshake worker - stopped
2019-04-07 21:13:50.380969: [NET] Routine: handshake worker - stopped
2019-04-07 21:13:50.381144: [NET] Routine: decryption worker - stopped
2019-04-07 21:13:50.381311: [NET] peer(jDeN=E2=80=A6juhA) - Routine: nonce w=
orker - stopped
2019-04-07 21:13:50.381697: [NET] Interface closed
2019-04-07 21:13:50.398005: [APP] Tunnel 'Arkadia' connection status changed=
 to 'disconnected'
2019-04-07 21:13:50.494592: [APP] Tunnel 'Arkadia' connection status changed=
 to 'connecting'
2019-04-07 21:13:50.593360: [NET] App version: 0.0.20190319 (1); Go backend v=
ersion: 0.0.20181222
2019-04-07 21:13:50.593849: [NET] Starting tunnel from the OS directly, rath=
er than the app
2019-04-07 21:13:50.661066: [NET] Tunnel interface is utun2
2019-04-07 21:13:50.704650: [NET] DNS64: mapped 3.84.245.133 to 2607:7700::2=
a:0:1:354:f585
2019-04-07 21:13:50.707040: [NET] Attaching to interface
2019-04-07 21:13:50.711360: [NET] Routine: decryption worker - started
2019-04-07 21:13:50.711752: [NET] Routine: decryption worker - started
2019-04-07 21:13:50.711984: [NET] Routine: handshake worker - started
2019-04-07 21:13:50.712146: [NET] Routine: handshake worker - started
2019-04-07 21:13:50.712785: [NET] Routine: encryption worker - started
2019-04-07 21:13:50.713264: [NET] Routine: decryption worker - started
2019-04-07 21:13:50.713670: [NET] Routine: encryption worker - started
2019-04-07 21:13:50.714084: [NET] Routine: handshake worker - started
2019-04-07 21:13:50.714346: [NET] Routine: handshake worker - started
2019-04-07 21:13:50.714525: [NET] Routine: handshake worker - started
2019-04-07 21:13:50.714747: [NET] Routine: encryption worker - started
2019-04-07 21:13:50.714982: [NET] Routine: decryption worker - started
2019-04-07 21:13:50.715216: [NET] Routine: encryption worker - started
2019-04-07 21:13:50.715390: [NET] Routine: encryption worker - started
2019-04-07 21:13:50.715565: [NET] Routine: decryption worker - started
2019-04-07 21:13:50.715725: [NET] Routine: encryption worker - started
2019-04-07 21:13:50.715895: [NET] Routine: handshake worker - started
2019-04-07 21:13:50.716058: [NET] Routine: TUN reader - started
2019-04-07 21:13:50.716408: [NET] Routine: event worker - started
2019-04-07 21:13:50.716680: [NET] Routine: decryption worker - started
2019-04-07 21:13:50.717007: [NET] UAPI: Updating private key
2019-04-07 21:13:50.718143: [NET] UAPI: Removing all peers
2019-04-07 21:13:50.718379: [NET] UAPI: Transition to peer configuration
2019-04-07 21:13:50.720139: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Created
2019-04-07 21:13:50.720455: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating e=
ndpoint
2019-04-07 21:13:50.720763: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating p=
ersistent keepalive interval
2019-04-07 21:13:50.720904: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Removing a=
ll allowedips
2019-04-07 21:13:50.721078: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Adding all=
owedip
2019-04-07 21:13:50.722473: [NET] Routine: receive incoming IPv4 - started
2019-04-07 21:13:50.722927: [NET] Routine: receive incoming IPv6 - started
2019-04-07 21:13:50.723217: [NET] UDP bind has been updated
2019-04-07 21:13:50.723356: [NET] peer(jDeN=E2=80=A6juhA) - Starting...
2019-04-07 21:13:50.723625: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequent=
ial receiver - started
2019-04-07 21:13:50.723824: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequent=
ial sender - started
2019-04-07 21:13:50.724046: [NET] Device started
2019-04-07 21:13:50.724072: [NET] peer(jDeN=E2=80=A6juhA) - Routine: nonce w=
orker - started
2019-04-07 21:13:50.729175: [APP] Tunnel 'Arkadia' connection status changed=
 to 'connected'
2019-04-07 21:13:50.739717: [NET] UAPI: Processing get operation
2019-04-07 21:13:50.850833: [NET] peer(jDeN=E2=80=A6juhA) - Sending handshak=
e initiation
2019-04-07 21:13:50.856845: [NET] peer(jDeN=E2=80=A6juhA) - Awaiting keypair=

2019-04-07 21:13:50.961456: [NET] peer(jDeN=E2=80=A6juhA) - Received handsha=
ke response
2019-04-07 21:13:50.962122: [NET] peer(jDeN=E2=80=A6juhA) - Obtained awaited=
 keypair
2019-04-07 21:13:51.732883: [NET] UAPI: Processing get operation
2019-04-07 21:13:52.733067: [NET] UAPI: Processing get operation
=20
=20
=20
=20

--Apple-Mail-2A7D87EA-5949-4369-92BA-FA6C9AE9BF7F
Content-Type: multipart/related;
	type="text/html";
	boundary=Apple-Mail-F6679553-3489-4DC6-8B4C-268C7CE2DFFC
Content-Transfer-Encoding: 7bit


--Apple-Mail-F6679553-3489-4DC6-8B4C-268C7CE2DFFC
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr"><span></span></div><div di=
r=3D"ltr">

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-12=
52">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>


<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Any thoughts on this=
:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Running T-Mobile Iph=
one XS, replicated on IOS 12.2 and 12.3 Beta 1 and Beta 2<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Algo VPN installed o=
n Lightsail (IPv4 Only)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Vultr, Digital Ocean=
, and EC2 (IP4v and IPv6 both enabled)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Algo issue link - <a=
 href=3D"https://github.com/trailofbits/algo/issues/1385">
https://github.com/trailofbits/algo/issues/1385</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I=E2=80=99ve been us=
ing the IOS WG app since its release and in the past 7-10 days, the VPN stop=
s transitioning from WiFi to LTE when &nbsp;disconnecting via IOS control ce=
nter or walking away from WiFi. &nbsp;the WG app shows
 connected, but no traffics passes, once I restart the tunnel I=E2=80=99m ab=
le to connect. Prior to this, the transition worked.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Logs and Screenshots=
 below<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></s=
pan></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:12.0p=
t;font-family:Helvetica;color:black">Logs using current Algo code on Lightsa=
il&nbsp;</span><span style=3D"font-family:Helvetica;color:black"><o:p></o:p>=
</span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">=E2=80=94=
-transition from WiFi to LTE =E2=80=94 via waking away from wifi.</span><spa=
n style=3D"font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>&nbsp=
;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.673495: [NET] Network change detected with requiresConnection rou=
te and interface order [en0, utun2, pdp_ip0, pdp_ip0]</span><span style=3D"f=
ont-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.680611: [NET] DNS64: mapped 3.84.245.133 to itself.</span><span s=
tyle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span=
></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.681644: [NET] UAPI: Transition to peer configuration</span><span s=
tyle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span=
></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.682070: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating endpoint</=
span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>=
</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.682388: [NET] Binding sockets to interface 8</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.682680: [NET] Unable to bind v6 socket to interface:%!(EXTRA sysc=
all.Errno=3Dinvalid argument)</span><span style=3D"font-size:9.0pt;font-fami=
ly:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.703063: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send data packe=
t write udp4 0.0.0.0:53791-&gt;3.84.245.133:51820: sendto: network is unreac=
hable</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:12.715650: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send data packe=
t write udp4 0.0.0.0:53791-&gt;3.84.245.133:51820: sendto: network is unreac=
hable</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.088433: [NET] Network change detected with satisfied route and in=
terface order [pdp_ip0, utun2]</span><span style=3D"font-size:9.0pt;font-fam=
ily:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.122617: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send data packe=
t write udp4 0.0.0.0:53791-&gt;3.84.245.133:51820: sendto: network is unreac=
hable</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.134085: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send data packe=
t write udp4 0.0.0.0:53791-&gt;3.84.245.133:51820: sendto: network is unreac=
hable</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.135346: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send data packe=
t write udp4 0.0.0.0:53791-&gt;3.84.245.133:51820: sendto: network is unreac=
hable</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.251423: [NET] DNS64: mapped 3.84.245.133 to 2607:7700::2a:0:1:354=
:f585</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.251890: [NET] UAPI: Transition to peer configuration</span><span s=
tyle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span=
></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.252095: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating endpoint</=
span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>=
</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.252255: [NET] Binding sockets to interface 2</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.252389: [NET] Unable to bind v6 socket to interface:%!(EXTRA sysc=
all.Errno=3Dinvalid argument)</span><span style=3D"font-size:9.0pt;font-fami=
ly:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:12:13.292057: [NET] peer(jDeN=E2=80=A6juhA) - Handshake did not complet=
e after 5 seconds, retrying</span><span style=3D"font-size:9.0pt;font-family=
:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>&nbsp=
;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>&nbsp=
;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">=E2=80=94=
-force tunnel restart=E2=80=94</span><span style=3D"font-family:Helvetica;co=
lor:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>&nbsp=
;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>&nbsp=
;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">Sending h=
andshake initiation</span><span style=3D"font-size:9.0pt;font-family:Helveti=
ca;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:46.269371: [NET] peer(jDeN=E2=80=A6juhA) - Failed to send handshake i=
nitiation write udp6 [::]:53791-&gt;[2607:7700:0:2a:0:1:354:f585]:51820: sen=
dto: no route to host</span><span style=3D"font-size:9.0pt;font-family:Helve=
tica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:47.018560: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:47.657352: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:47.673847: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:48.675486: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:49.675755: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.043331: [APP] startDeactivation: Tunnel: Arkadia</span><span styl=
e=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></=
p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.049399: [APP] Tunnel 'Arkadia' connection status changed to 'disc=
onnecting'</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:=
black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.373260: [NET] Stopping tunnel</span><span style=3D"font-size:9.0p=
t;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.373977: [NET] Device closing</span><span style=3D"font-size:9.0pt=
;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.374774: [NET] Routine: event worker - stopped</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.376321: [NET] Routine: TUN reader - stopped</span><span style=3D"=
font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.376883: [NET] Routine: receive incoming IPv4 - stopped</span><spa=
n style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></s=
pan></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.377108: [NET] Routine: receive incoming IPv6 - stopped</span><spa=
n style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></s=
pan></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.377425: [NET] peer(jDeN=E2=80=A6juhA) - Stopping...</span><span s=
tyle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span=
></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.377699: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequential recei=
ver - stopped</span><span style=3D"font-size:9.0pt;font-family:Helvetica;col=
or:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.377929: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequential sende=
r - stopped</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color=
:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.378133: [NET] Routine: encryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.378316: [NET] Routine: encryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.378477: [NET] Routine: encryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.378631: [NET] Routine: encryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.378834: [NET] Routine: handshake worker - stopped</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379012: [NET] Routine: encryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379178: [NET] Routine: decryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379337: [NET] Routine: encryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379498: [NET] Routine: decryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379649: [NET] Routine: decryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379812: [NET] Routine: decryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.379968: [NET] Routine: decryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.380118: [NET] Routine: handshake worker - stopped</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.380271: [NET] Routine: handshake worker - stopped</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.380540: [NET] Routine: handshake worker - stopped</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.380771: [NET] Routine: handshake worker - stopped</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.380969: [NET] Routine: handshake worker - stopped</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.381144: [NET] Routine: decryption worker - stopped</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.381311: [NET] peer(jDeN=E2=80=A6juhA) - Routine: nonce worker - s=
topped</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:blac=
k"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.381697: [NET] Interface closed</span><span style=3D"font-size:9.0=
pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.398005: [APP] Tunnel 'Arkadia' connection status changed to 'disc=
onnected'</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:b=
lack"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.494592: [APP] Tunnel 'Arkadia' connection status changed to 'conn=
ecting'</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:bla=
ck"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.593360: [NET] App version: 0.0.20190319 (1); Go backend version: 0=
.0.20181222</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color=
:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.593849: [NET] Starting tunnel from the OS directly, rather than t=
he app</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:blac=
k"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.661066: [NET] Tunnel interface is utun2</span><span style=3D"font=
-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.704650: [NET] DNS64: mapped 3.84.245.133 to 2607:7700::2a:0:1:354=
:f585</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black=
"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.707040: [NET] Attaching to interface</span><span style=3D"font-si=
ze:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.711360: [NET] Routine: decryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.711752: [NET] Routine: decryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.711984: [NET] Routine: handshake worker - started</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.712146: [NET] Routine: handshake worker - started</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.712785: [NET] Routine: encryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.713264: [NET] Routine: decryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.713670: [NET] Routine: encryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.714084: [NET] Routine: handshake worker - started</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.714346: [NET] Routine: handshake worker - started</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.714525: [NET] Routine: handshake worker - started</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.714747: [NET] Routine: encryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.714982: [NET] Routine: decryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.715216: [NET] Routine: encryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.715390: [NET] Routine: encryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.715565: [NET] Routine: decryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.715725: [NET] Routine: encryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.715895: [NET] Routine: handshake worker - started</span><span sty=
le=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span><=
/p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.716058: [NET] Routine: TUN reader - started</span><span style=3D"=
font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.716408: [NET] Routine: event worker - started</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.716680: [NET] Routine: decryption worker - started</span><span st=
yle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.717007: [NET] UAPI: Updating private key</span><span style=3D"fon=
t-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.718143: [NET] UAPI: Removing all peers</span><span style=3D"font-=
size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.718379: [NET] UAPI: Transition to peer configuration</span><span s=
tyle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span=
></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.720139: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Created</span><span=
 style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></sp=
an></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.720455: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating endpoint</=
span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p>=
</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.720763: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Updating persistent=
 keepalive interval</span><span style=3D"font-size:9.0pt;font-family:Helveti=
ca;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.720904: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Removing all allowe=
dips</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"=
><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.721078: [NET] peer(jDeN=E2=80=A6juhA) - UAPI: Adding allowedip</s=
pan><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p><=
/o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.722473: [NET] Routine: receive incoming IPv4 - started</span><spa=
n style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></s=
pan></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.722927: [NET] Routine: receive incoming IPv6 - started</span><spa=
n style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></s=
pan></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.723217: [NET] UDP bind has been updated</span><span style=3D"font=
-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.723356: [NET] peer(jDeN=E2=80=A6juhA) - Starting...</span><span s=
tyle=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span=
></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.723625: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequential recei=
ver - started</span><span style=3D"font-size:9.0pt;font-family:Helvetica;col=
or:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.723824: [NET] peer(jDeN=E2=80=A6juhA) - Routine: sequential sende=
r - started</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color=
:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.724046: [NET] Device started</span><span style=3D"font-size:9.0pt=
;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.724072: [NET] peer(jDeN=E2=80=A6juhA) - Routine: nonce worker - s=
tarted</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:blac=
k"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.729175: [APP] Tunnel 'Arkadia' connection status changed to 'conn=
ected'</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:blac=
k"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.739717: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.850833: [NET] peer(jDeN=E2=80=A6juhA) - Sending handshake initiat=
ion</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black">=
<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.856845: [NET] peer(jDeN=E2=80=A6juhA) - Awaiting keypair</span><s=
pan style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p><=
/span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.961456: [NET] peer(jDeN=E2=80=A6juhA) - Received handshake respon=
se</span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><=
o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:50.962122: [NET] peer(jDeN=E2=80=A6juhA) - Obtained awaited keypair<=
/span><span style=3D"font-size:9.0pt;font-family:Helvetica;color:black"><o:p=
></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:51.732883: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;caret-color: rgb(0, 0, 0);font-=
variant-caps: normal;orphans: auto;text-align:start;widows: auto;-webkit-tex=
t-size-adjust: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word=
-spacing:0px">
<span style=3D"font-size:12.0pt;font-family:Helvetica;color:black">2019-04-0=
7 21:13:52.733067: [NET] UAPI: Processing get operation</span><span style=3D=
"font-size:9.0pt;font-family:Helvetica;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"caret-color: rgb(0, 0, 0);font-variant-caps:=
 normal;orphans: auto;text-align:start;widows: auto;-webkit-text-size-adjust=
: auto;-webkit-text-stroke-width: 0px;font-stretch: normal;word-spacing:0px"=
>
<o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>


</div><div dir=3D"ltr"><img src=3D"cid:AC4B50CB-EDDA-4404-A8D8-AED4DE2F68F3"=
 id=3D"AC4B50CB-EDDA-4404-A8D8-AED4DE2F68F3"></div></body></html>=

--Apple-Mail-F6679553-3489-4DC6-8B4C-268C7CE2DFFC
Content-Type: image/jpeg;
	name=IMG_0004.jpg;
	x-apple-part-url=AC4B50CB-EDDA-4404-A8D8-AED4DE2F68F3
Content-Disposition: inline;
	filename=IMG_0004.jpg
Content-Transfer-Encoding: base64
Content-Id: <AC4B50CB-EDDA-4404-A8D8-AED4DE2F68F3>

/9j/4AAQSkZJRgABAQAASABIAAD/4QD+RXhpZgAATU0AKgAAAAgABQESAAMAAAABAAEAAAEaAAUA
AAABAAAASgEbAAUAAAABAAAAUgEyAAIAAAAUAAAAWodpAAQAAAABAAAAbgAAAAAAAABIAAAAAQAA
AEgAAAABMjAxOTowNDowNSAxMDowMjoxNAAABpADAAIAAAAUAAAAvJAEAAIAAAAUAAAA0JKGAAcA
AAASAAAA5KABAAMAAAABAAEAAKACAAQAAAABAAACUKADAAQAAAABAAAFAAAAAAAyMDE5OjA0OjA1
IDEwOjAyOjE0ADIwMTk6MDQ6MDUgMTA6MDI6MTQAQVNDSUkAAABTY3JlZW5zaG90/+EJ9Wh0dHA6
Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8APD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBD
ZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIg
eDp4bXB0az0iWE1QIENvcmUgNS40LjAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cu
dzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjph
Ym91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOnBo
b3Rvc2hvcD0iaHR0cDovL25zLmFkb2JlLmNvbS9waG90b3Nob3AvMS4wLyIgeG1wOkNyZWF0ZURh
dGU9IjIwMTktMDQtMDVUMTA6MDI6MTQiIHhtcDpNb2RpZnlEYXRlPSIyMDE5LTA0LTA1VDEwOjAy
OjE0IiBwaG90b3Nob3A6RGF0ZUNyZWF0ZWQ9IjIwMTktMDQtMDVUMTA6MDI6MTQiLz4gPC9yZGY6
UkRGPiA8L3g6eG1wbWV0YT4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8P3hwYWNrZXQgZW5kPSJ3Ij8+AP/tADhQaG90b3Nob3AgMy4wADhCSU0E
BAAAAAAAADhCSU0EJQAAAAAAENQdjNmPALIE6YAJmOz4Qn7/wAARCAUAAlADASIAAhEBAxEB/8QA
HwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQAAAF9AQIDAAQR
BRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3ODk6Q0RFRkdI
SUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWmp6ipqrKztLW2
t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEAAwEBAQEBAQEB
AQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSExBhJBUQdhcRMi
MoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElKU1RVVldYWVpj
ZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3uLm6wsPExcbH
yMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9sAQwAGBgYGBgYKBgYKDgoKCg4SDg4ODhIX
EhISEhIXHBcXFxcXFxwcHBwcHBwcIiIiIiIiJycnJycsLCwsLCwsLCws/9sAQwEHBwcLCgsTCgoT
Lh8aHy4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4uLi4u/90A
BAAl/9oADAMBAAIRAxEAPwD6doooNACUUUUAIaKDRTAKKKKQBRRRQAtFFFAC0tJRQA6ikpaAFopB
S0AFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRR
QAUUUUAFFFFABRRRQAUUUUAFJS0lAmIaSlNJSExtNpxpppECUhpaKkhjaSlpKQgooooAcKWkFLTA
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
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKACiiigAooooAKKKKACiiigAooooA//0fqiiiigAqMrLnIYAfT/AOvUlFAEW2b++P8Avn/69G2b
++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAE
W2b++P8Avn/69G2b++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRt
m/vj/vn/AOvUtFAEW2b++P8Avn/69G2b++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQ
BFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAEW2b++P8Avn/69G2b++P++f8A69S0UARbZv74/wC+f/r0
bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAEW2b++P8Avn/69G2b++P++f8A69S0
UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAEW2b++P8Avn/6
9G2b++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvU
tFAEW2b++P8Avn/69G2b++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/
+vRtm/vj/vn/AOvUtFAEW2b++P8Avn/69G2b++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr
1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAEW2b++P8Avn/69G2b++P++f8A69S0UARbZv74/wC+
f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAEW2b++P8Avn/69G2b++P++f8A
69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/AOvUtFAEW2b++P8A
vn/69G2b++P++f8A69S0UARbZv74/wC+f/r0bZv74/75/wDr1LRQBFtm/vj/AL5/+vRtm/vj/vn/
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
bq0caq2PqBmtuiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAphjjLiQqN4GA2OcfWn0UARyRRzIY5VDqeoYZB/A0yC2t7ZdlvGkYPZQ
AP0qeigBgjjDmQKAxGCcckfWh445MCRQ2DkZGcGn0UAIyhgVYZB6g1Xhs7S3YtbwpGT1KqB/KrNF
ADGjjcguoYqcjIzg+1PoooAZ5ce/zNo3Yxuxzj60SRxyoUlUMp6gjINPooAggtba2BFvEkYPXaoG
fyqTy49/mbRuxjdjnH1p9FABUJiVFfyFVHbJzjGW9TU1FAGXo2nf2Xp8dmW3sMszerMck1ce1tZG
LyRIxPUlQTViigCBLW2jYPHEisOhCgGp6KKAGLHGrF1UBm6kDk/Wn0UUAFFFFAH/1fqiiiigAooq
Mo5PDkfgKAJKKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P
/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJa
Ki2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/k
KAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/
98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5
CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P
/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJa
Ki2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/k
KAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/98/kKAJaKi2P/fP5CjY/
98/kKAJaKi2P/fP5CjY/98/kKAP/1vqiiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
D//X+qKKKKACsC88SaXY67aeHbh2F3eo0kShSQVTrk9BW/XjXif/AJK/4a/69Z/60Aey1y2jeJ01
jWdT0dbSeA6Y6oZZFwkm7PKHv0rqa818N+KNSvvEniexviHt9JkQQKq/NtKsSD6nigD0qqOoalY6
TaPf6lMkEEeN0jkBRk4GSfc14toOsfEHxrpjeJNH1KytFZ5PJsWQucIxAEjZyCcdqq/FT/hK7/4c
Lf3/AJViVRBe2pG8s/mqFKODgDv9KAPfkdZFV0OVYAgjuDT68pbW9a8D+CZdZ8RXEd/IqRC2SJDH
y4CqpznPJHNYdzcfFWw0o+JZb6xlZE899PCEYTGSofOdwFAHuVFeL+K/iBqlvo3hrWfDyK/9sSop
iYfe3qMLnthjyap+ItV+JHgq2TxPq13aXtisqC5to4ypjRzj5GJ5x70Ae6UVHFIJY1lXo6hh+Iry
DxF4r8WQ/ENfCGgLE4udPWVDKPlifzDukcjkqFUgDuSKAPY6K8Um13xv4I1nT18WXMGoaXqMwtzN
EhjaGVvu5HcGtPxF4l8S6l4r/wCEJ8HGGGaCET3d1MCyxK33VVR3NAHrFFeOWniDxh4U8S2GheL5
Yb601VjFb3UKlCkvZXHTmqDeIfHut+Mda8L6DJbwRWToRcTKT5akdAB95ifyoA9ivtV0/TDCL+dI
DcyCKLeQN7t0UZ6k1fr5w+J2neLo38NLdajBITe2sakRkYuRgGQ+qk84r3nQ7fVrXTo4dcuEursF
t8sa7FILHbgH0GBQBr0UUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFA
BRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABVK/v7XTLZru8bYi/mT2A96u1wPi
y7ii1fTIbkF4VLylBzvdQNox9f50AaC+LrdSr3drPbwuQFlkXC89M+ldYrBlDKcgjIPsa4jUNY1G
O3La3pn+gvw+G3FQe7AVv3upWum6QLu3wy7AIFHO4kYQCgCvf+JtP0/UI9NkDvLIVX5RkKWOACc1
s3d3b2Ns93dMEjjGSTXnGoaY9hZ6fNdHddXF7HJM3fJPT6CvRL6xtdRhEF4u+MMGxnHI6UAc4fF8
EYE89pcR25P+uZPlwe9dObmAW/2suPK279+eNuM5rjPEHiCD7NPpMcLhpMw75BtjXtksew7VX8RK
uneE7SxEm6NniiZx0K/eOPbigDU/4S+3KmeO0uHth/y2CfL9fXFdHDfWk9ot9HIDCy7t54GK5Y6v
qsdqJbTS91iq4UFgHMYHUL9Kv2Vpo2taNClshW1Lb/LBI5B5U/j2oAn0zxHp+rXstjZ7mMS7ixGF
Izjit+uK0+KOHxndxRKERbOMBQMAfNXa0AFFFFAH/9D6oooooAK8K8d6pYaL8UvDuo6pMsFvHazb
pH4UZJAr3WqF3pemX7K9/aw3DKMAyxq5A9twNAHK23xJ8EXdxHaW2qwPLKwRFDclmOAPxNcj4Ika
Hxt43mVDIUniYIvVsIxwPc16hH4f0GJ1li061R1OVZYUBBHcEDir8dpawSyTwxIkkpBkZVAZiOhY
jk/jQB843B+FmqWtxrdleTeH9QBcvHFI0MgkBP3os4OT2HBq7qs3iLWvgTJc6yjyXhVXJK4dokmB
DFfXaM/rXuc2g6HcXP2y4sbeSbOfMaJC2fXJHWtRkRkMbKCpGMEcY9MUAeFeMpbTx58Mi3huQXj2
Yt5ZI4z83yAFlx13YzxXOrJ8H30VdQku7kytGN1qLmUzbyOU2ZznPFfR1pYWNgrLY28VuHOWESKg
J9TtAqougaGtz9tWwthPnPmCJN2fXOOtAHifiu1tLSy8DW+nwSW1uL6MpDLy6KVBAb3Fdf8AGkZ+
G+qf9sv/AEYtelz2trcsjXESSmNtyF1DbW9RnofcUtzbW15C1vdxJNE33kkUMp+oORQBHY/8eUH/
AFzT+QrwrxDr9v4b+NMWoXqt9lOkLHNIBkRK0rYdvQbsAn3r3/AAwowB0Arz1/C97L8SH8TTJG9g
+l/YyrYJL+buIKnqMUAcH458Q6X48vNI8J+F5heyPex3E8kXKRRR5JJbsatXOoW/gb4pX2q64TDp
+tW0YjuSPkSSPAKse3Ar2Wx0nStNLNp1pDbF/vGJFQn64FT3dnZ30P2e+hjnjP8ADIoZfyNAHh/i
HXLHx54w8P6T4acXcWnXQvbmePmNFQYC7umTWv4IH/Fx/F/+/B/I16pY6bp2moYtOtordT1ESBM/
XAGamjtLWGaSeKJEklxvdVAZsdNxAyfxoA8j+MTfZbXQdVkB+z2WrQSzMBnagOST+Vep6Vquna1Z
JqOlzLcW8mdsiHIO04P5EYq5NBBcxNBcRrLG3BVwGU/UHimWtpa2UIt7OJIIlzhI1CqM8ngYHWgC
xRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAF
FFFABRRRQAUUUUAFFFFABRRRQAUUUUAFcd4otJUuLHW4YzL9ik3SKvJ2HGSPpiuxooA4TWfEunX+
mS2OnZuJ7ldixhTkFuOfTFTTeGr2ex06JLnynslBwRuG/wBce1dcltbxOZI40Vj3CgH86noA8v8A
EWna5GLP7TeibdcoFwmNrZ4b8K62+n1fSdJSZcXk0TDzTjBKZ5IA7iuhKq2NwBxyMinUAcbfeKdE
uNPljBMzyIVEO07iSOAR2rNk0G+n8Fw2Mi5uIcSqh68Enb+RrvVtrZX81YkD/wB4KM/nU9AHHL4w
0oWO5yyzhcGDad+7GMYqz4Rsbix0gC6XY80jzbP7ofoK6E21uZPNMaF/720Z/Op6AOPtFYeNbxsc
G0Tn/gVdhTdqhtwAye/enUAFFFFAH//R+qKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKK
KKAP/9L6oooooAKjKOTkOR+X+FSUUAReW/8Az0P6f4UeW/8Az0P6f4VLRQBF5b/89D+n+FHlv/z0
P6f4VLRQBF5b/wDPQ/p/hR5b/wDPQ/p/hUtFAEXlv/z0P6f4UeW//PQ/p/hUtFAEXlv/AM9D+n+F
Hlv/AM9D+n+FS0UAReW//PQ/p/hR5b/89D+n+FS0UAReW/8Az0P6f4UeW/8Az0P6f4VLRQBF5b/8
9D+n+FHlv/z0P6f4VLRQBF5b/wDPQ/p/hR5b/wDPQ/p/hUtFAEXlv/z0P6f4UeW//PQ/p/hUtFAE
Xlv/AM9D+n+FHlv/AM9D+n+FS0UAReW//PQ/p/hR5b/89D+n+FS0UAReW/8Az0P6f4UeW/8Az0P6
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
vl/vt+n+FG+X++36f4UWA06KzN8v99v0/wAKN8v99v0/wosBp0Vmb5f77fp/hRvl/vt+n+FFgNOi
szfL/fb9P8KN8v8Afb9P8KLAadFZm+X++36f4Ub5f77fp/hRYDTorM3y/wB9v0/wo3y/32/T/Ciw
GnRWZvl/vt+n+FG+X++36f4UWA//1/pSiiiqAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
A//Q+lKKKKoAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD/9H6UoooqgCiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKAP/0vpSiiiqAK5y+1LUl1YaZp0UbnyRKS7bepIro64y+/tD/hKv
+JcIy/2QZ8wkDG4+lAGjaaxcmeew1CERXEURmUA7ldRnkH61SsdS8RahaR3sFvBslGVy+Dj8qsQ6
ZeLLc6rqcivO0DRoqfdVcE9+pJrI8P6bey6NbSR6g8SsgIQKuB7UAbeo6nqVveWen2sUbzXCOzbm
wAUAzzj3q5Zy6xl21CKJECkqUbJzWFrUEs+v6ZDFOYW8qb94ACeAPX1rctLO5tUlM921zuQ4DADH
vxQBjWWreIL6wTUobWJonDELvwxCkg9vaui0zUI9UsY76IFRIOh6gg4I/OvPbFtftvCkd3aTR+Qq
sdoUlwm9gxz0JHJrvtGt7W10yCKybfFtDBj1bdySfzoA06KKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD/9P6UoooqgCq
v2OD7Z9u2/vdnl5/2c5xVqigBrqHRkbowIP0Nc8vhXSEXaglVR0AkYAV0dFAGReaJYX3k/aA+YFK
oVYggH3H0p1lo1lYO7wbyXXadzlhj8a1aKAKltZW1paLYwLiJQQFPPDEk/zpbOzgsLdbW2BWNc4B
OcZ5q1RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUU
UAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQ
AUUUUAFFFFABRRRQAUUUUAFFFFAH/9T6f+yx+p/Oj7LH6n86s0U7gVvssfqfzo+yx+p/OrNFFwK3
2WP1P50fZY/U/nVmii4Fb7LH6n86PssfqfzqzRRcCt9lj9T+dH2WP1P51ZoouBW+yx+p/Oj7LH6n
86s0UXArfZY/U/nR9lj9T+dWaKLgVvssfqfzo+yx+p/OrNFFwK32WP1P50fZY/U/nVmii4Fb7LH6
n86PssfqfzqzRRcCt9lj9T+dH2WP1P51ZoouBW+yx+p/Oj7LH6n86s0UXArfZY/U/nR9lj9T+dWa
KLgVvssfqfzo+yx+p/OrNFFwK32WP1P50fZY/U/nVmii4Fb7LH6n86PssfqfzqzRRcCt9lj9T+dH
2WP1P51ZoouBW+yx+p/Oj7LH6n86s0UXArfZY/U/nR9lj9T+dWaKLgVvssfqfzo+yx+p/OrNFFwK
32WP1P50fZY/U/nVmii4Fb7LH6n86PssfqfzqzRRcCt9lj9T+dH2WP1P51ZoouBW+yx+p/Oj7LH6
n86s0UXArfZY/U/nR9lj9T+dWaKLgVvssfqfzo+yx+p/OrNFFwK32WP1P50fZY/U/nVmii4Fb7LH
6n86PssfqfzqzRRcCt9lj9T+dH2WP1P51ZoouBW+yx+p/Oj7LH6n86s0UXArfZY/U/nR9lj9T+dW
aKLgVvssfqfzo+yx+p/OrNFFwK32WP1P50fZY/U/nVmii4Fb7LH6n86PssfqfzqzRRcCt9lj9T+d
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
IcBy4AReyqO1elUUAcrdx6lr2h3VrPB9kmfhFLZ3AYPUevSswnW7jTDpUWnrbt5WxpCRjgY+Uepr
vaKAOSgTWNM8NW0NlAHuo1VWRj0Geata5p93qFjDNb4W7tmWVB23D7y/j0ro6KAODv5td162/sr7
G1qspAmlY8BRydvrXQahocN9p8OniR4khKkFDg/KMYrcooAaowoX0GK5nwxYXVlZ3UV2hQyXUjr7
qwGDXUUUAYNjog0/Tp7GCeRjKWYOxyVLDtWTbal4i0+EWd3YtcyJwJUPD+hPpXaUUActoml3sUd7
d35EdxfMWIX+AYwPxFUba98RaVEbK5s2vChISZT94dt1dvRQByGkaFK9tey6wB5uotukRT91ewzT
pPB2jrEwiWTIU7RvPXHFdbRQByHhLQv7LsEluEZLl1ZXBORjdkcdK0bLQLe1s7mykkeaO6Zi288g
N2Fb1FAHJnwdoyxlY1cYBwN5qLwv4fTT7EtcoyzSB0cE5G0k446dK7GigDhLH+2PDiPpyWjXcAYt
C6HoGOcNV3SdHvPs99dX5CXeoA5xzsXBCj8M111FAHA6Uut6dZJpKaevmJlRPkbDz9496LDw7dTe
GJtJu/3czSs6k+oIKn8cV31FAHFJfeIxbi0OnL9oA2+aSNmem6tq9EkOhTx3bqZfs77iOATtOcCt
us3UNJstT2i7UttBAwSOvWgDO0Bpk8L2rW6hpBbgoD0LY4qSFdV1HRGjvf8ARbuRSMofukHiti2t
obS3S1gG2OMbVHoBU9AHEx6p4ktrYWcuntLcKNolB+RiP4jWx4d0uTSdO8mdg00jtLIR03N1reoo
A5iCxuk8WXGoMmIHtVjDerBgcflVO6tNT0rW5tXsIftMV0oEiA4ZSvcV2dFAHGH+1tbv7V5bU2tv
ayeaS5+ZmwQAB+NdnRRQAUUUUAf/1PqiiiigAoopMigBaKMj1oyPWgAooyPWjI9aACijI9aMj1oA
KKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAo
oyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACij
I9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj1oyPWgAooyPWjI9aACijI9aMj1oAKKMj
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
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKimhjuImgmG5HBVh6g
1LRQBHFGkMaxRjaqAKAOwHSpKKKACiiigAooooA//9H6oooooAKbuUcEinUwoh5IFAC719RRvX1F
J5af3RR5af3RQAu9fUUb19RSeWn90UeWn90UALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3R
R5af3RQAu9fUUb19RSeWn90UeWn90UALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3R
QAu9fUUb19RSeWn90UeWn90UALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fU
Ub19RSeWn90UeWn90UALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RS
eWn90UeWn90UALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90U
eWn90UALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90UeWn90U
ALvX1FG9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90UeWn90UALvX1F
G9fUUnlp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90UeWn90UALvX1FG9fUUn
lp/dFHlp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90UeWn90UALvX1FG9fUUnlp/dFH
lp/dFAC719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90UeWn90UALvX1FG9fUUnlp/dFHlp/dFA
C719RRvX1FJ5af3RR5af3RQAu9fUUb19RSeWn90UeWn90UAf/9L6oooooAKKKKACiiigAooooAKK
KKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooA//0/qiiiigAryTxt4k8U2ni3SvDPhpoUa/hkkLTLkAoT/SvW68a8T/
APJX/DX/AF6z/wAzQA2+1b4qeG4G1PULe11K1i+aVIMrIFHUgd8V6X4f1/T/ABHo0Guae+YJ13c8
FSOoPuD1rZcIUYSY2kHdnpjvmvmzwQdN/wCFca1Fqt69jpx1KZY5UOG8vKnav1ORxQB9BQa3pFzP
9mt7uGSXpsVwT+Wa5fxn42tvCbWEZ2SSXd3FA6lgCiSZ+cj0GK8G8YXXgq18NPdeF9OurW9tTG8F
2I3UZDjlnPUEfrXZfFLStN1Gz8NavdQK1zeX1nFK/do2Ukr9MmgD3qG8tLiH7TBKjxc/OrArx15q
pb63pF3N9ntruGSQcbVcE/kDXHeKtK8MaP4Sk0y4nOlacXG7yTgsSclR3+avEPGF54NtNES88K6d
dWV5bSxNFdCNkUjcM7mPXIoA+tKpS6jYQNIk88aNEoZwzAFVPQn0p1jK1xZQTv8AekjRj9SoNeE3
fh6z8SfGTUrLUizWsdjBI8QJAkIAChsdhk8UAe5rqWnvaDUFuIzbnpLuGz069KSy1TTtRBNhcRz7
euxg2Pyr568aSaTY+MdM8GTW8w0SytWumtbZSfMkZiBuA52jrVY3Wm2PirRdS8E6beWZNysF7GYm
WJ4JPlLEHjK9aAPpG8v7LT4/NvZkhQ93YKP1pbS+s7+PzbKZJk9UYMP0rxS10u38efEfW017M1lo
gihgtiSELSLuLkd+h/Su20rwLZ+HPEJ1nQpWtrSSJkmtBkxs3UMPQigDsL3VdN07aL65jg3dN7Bc
/nTppRdafLJYzKC8beXKCCqnBw30B5r5g0XVtA1zVNW1nxfZXWpTNdSQwqsbPFFFGcADHGfWuq8B
3E9vJ4l0qzhuY9I8hp7QXCspQshDoM9hQB6r4VlurHQ7SDXtRivLqRnAmUgCQ7jgL6kDiuomnhto
mnuHEcajLMxwB9TXzTZaXcX3wU0/VbHJvNIla9hI6nypWLD8R/Kuw8e6sPFWg6DoGmOc+JJYmYr1
FugEkh/DigD2KW+s4LcXc8yJCQCHZgFwehzUdnqWn6ipexuI5wOuxg2Pyr598a6hp83xBtvDerwz
zaTplkki21upYPI3A3AfwgYqvaXVjZeNtHvvBen3dnFPN9nvomjZYjG/AbB4ytAH0Ve6lYacoe+n
jgB6F2C5/OuF1XxFcjxtoGn6fcK9nexTtIEIIYoBjmuO0rR7Px7481678Qg3FtpEiWtvbsTsBIyW
I7nimT+GrPw38VdBTTCUtZ4bhlgJysbAAHbnoDQB75RRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRR
RQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQBzGs6rqEcr2GlRbpVTe8rfcQc/
meKm0fUp5vD0ep3PzyeWXbA6kegrXvABaTnHWNv5GsXwlz4dtP8Ac/rQBm20XibU7YaiLlbYuN0c
O3gDsGrX8OarLq2n+dOu2WN2jkA6bl7iota1aSBl0zTR5l5MMKB0Qf3mq9o2lppFglmp3MMs7f3m
PJNAFTxBqs+nwwwWahrq6cRxA9Ae5P0rGvH1/QYV1O4uBdQqR5yYxgHqV+lWNc48S6Kz/c3Sgf72
BWp4oKjw/fb+nkt+eOKADVtRuorGKTS082S5KhD2AYZ3H2xWHqA8QaJbHVJLsXCRYMkZXAK98V0e
iEro1kJDhjCmM/SuX1yy1tYXur2VbizibzHhX5SUBzgnvigDuopBLEko6OoYfiM1xnizXL3Rruy+
zcxuWaVcZyqkZ/SuusriK6tIriD/AFciBl+hFcrr0Mdx4j0qCUZSRJ1YexQigDsIpUmiWaM5VwGB
9Qa4i+8Q3Q8VW2lWp/cBlSU46secZ9hUujal/ZelXlpen59LLLz/ABJ1T8+lYkNnJbTaLcXH+vu7
p55D3y4GB+AoA7YRSf26ZftXy+T/AMe/4/erm9Pm8Q6vPeNb3aRJBO0YUpngVfH/ACPLf9eI/wDQ
zWFodtrE02onTrhIUF0+Qy5yc9aAOg02/wBVt9YOjaqVl3xGSORBjODggiutrg7FbvS9fj/tgiaW
7UpFMOgxztx2zXeUAFFFFAH/1PqiiiigArx/xzovih/GOk+JvDtslz9hgkjZXbaMuTXsFFAHi98n
xW8S27aW8NvpUEw2yzBtzhTwdo9cVZ8Q/DfPgaz8N+Hivm6dPHdIJPuzOhJYN/vE16/RQB4L4o03
4ieM/DVzoslhDp6BVJUMCZWVgQq46Dv+FdR438KatrXhXTLfS9ovtLlt7hFY4VmhXBXP416lRQB5
B4q0DxN4y8MWc81vHbalY3a3K27NujfZxgn3zWH4q0z4h+NfD8mly2MWnxoUYoGBaUqwOBjoO9e9
0UAVLCJoLG3gk+9HEin6hQDXCWHh7UoPiZqPiSRB9juLKGFGzyWTGRivRqKAPMPGXhnWm12y8Z+F
9jX9pG0EsMnCzQtzjPqDS6bL8QdZ1a1m1CCPSrG3O6ZAQ8kx7L7CvTqKAPIdZ8PeJtA8WXHi/wAI
xpdJqEapeWrnaSycK6n1xWr4etvG2pa8db8RlbK0ijMcVlGd25m6s59u1ek0UAeKwaJ4w8Datfnw
1ax6jpuoTG4ERba8Ujfe69jXV6LZeLrnTtSn8SSRiW8jdYLaP7sQKkAFu5JNd/RQBwXw98P3WieC
rXQtYjHmKJFkTqCHYnH4g1yHgLwJrOi+IpLnWSHtNLiktdNOcny5JWcsfQ7cD6V7ZRQB5Z4s8N67
B4ltvG3hQJLdxwm2uLdzgSxZyMH1BqxpEnj/AFfWLe61SKPS7CDJeEEO8zdhnsK9LooA8c1LQfFf
hjxZeeJfCcKXltqgU3NszbSJFGAymorPw94x1Lxvpfi3XEjijhjlj8hDnylYcZPck9a9oooAKKKK
ACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA
KKKKAIbiMy28ka9WUgfiKyNKsbzTdCjsRtNxHGQP7u7tW7RQB55p+leKtPklnVbeSaY5aR2O76fS
uhC+IpdLnSUxR3ZP7oryuOOvv1roqKAOa1HR7rUtMt1lkC3tvtkWQdPMA5/A1m3Fh4h1pUsdSEcF
uGBlKHJfHOB9a7eigDA1jSZby3hFhJ5E1swaP04GMH2rKuYPFGpwNp9wsUEcg2ySKckqeuBXaUUA
VrS2jsrWK0i+5EoUfhWTf6bPc63YahGR5dr5m/PX5hgYrfooA43WvDc2o6rFdQuFhk2i5X++EOR/
hWnqmlzXl/p1xDgJaSl2B9MY4rfooA58aZOPEjatkeUbYRY77t2aw7TTfEumTXRshA0dxM0vznnm
u8ooA5K00jVLrUotS1mRCbcHy44+gJ75rraKKACiiigD/9X6oooooAKKKaXUcEigB1FM8xP7wo8x
P7woAfRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE
/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woA
fRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE/vCjz
E/vCgB9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPM
T+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCg
B9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPMT+8KP
MT+8KAH0UzzE/vCjzE/vCgB9FM8xP7wo8xP7woAfRTPMT+8KPMT+8KAH0UzzE/vCjzE/vCgB9FM8
xP7wo8xP7woAfRTPMT+8KPMT+8KAP//W+qKKKKACm7V7gU6igBuxfQUbF9BTqKAG7F9BRsX0FOoo
AbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRs
X0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG
7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9
BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBux
fQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU
6igBuxfQUbF9BTqKAG7F9BRsX0FOooAbsX0FGxfQU6igBuxfQUbF9BTqKAG7F9BRsX0FOooA/9f6
oooooAKKK8f8ca54pi8YaT4Z8OXMdv8AboJJGaRd3KE/0oA9gorxa/n+K3hq3bVZnttVghG6WJF2
PtHUr+FekeHPEen+JNCg16zbbDKpJ3cbCOGB+hoA6GisK28TeH7y5+x21/BJMTgIrgkmuY8c+Orf
wk+nwI0Ty3V3FDKjNgpE+cvj0GKAPRKKo2+pWF3am+tp45IBn94rArx159qo2vibw/fXH2S0voJZ
c42K4JNAG5RRWbqGr6ZpSB9SuY7cN03sBn86ANKiqVjqNjqUP2jT5knj/vIwYfpVC88S6Bp9x9kv
b6GKX+4zgGgDcoqrLe2cFqb6aVFgVdxkJ+XHrmsyfxN4ftpkt57+BJHAKqXAJDDIP40AbtFcp4w8
TW3hjw9dawXjMkcTPCjNjzGAyAPXNW/DniCx8Q6bDeW00byNGjSIjZ2FhnBoA6CiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKK4nX9V1fZcppkflR2q5kmbuR2Wuk0eeS50m0uJjueSFGY+pI5oA0qKwtev
L62t449OTdNPIIwcZCA9WP0rntSj1vQLb+1PthuFjK+bGwwCCccUAd9RXLa5q9xDb2kGnAfaL8hY
8/wgjJP4VnXkes+H0TU3uzcwqy+ejDopPJH0oA7qimI6yIHXkMAR9DXCeJdcvdJ1uzETf6PsDzLj
+HdtJ/DNAHfUU1WV1DochgCDXBLr13c+Mo7CFv8ARBvjPozIhJ/IkUAd/RWDBEq63dTC6LsYlzB2
TpzXMaMmvazby3a3/lBZ5Iwu3P3TQB6LRXI6PfalFrE2iam6ylIhKkijGQTjBrrqACiiigD/0Pqi
iiigArxrxP8A8lf8Nf8AXrP/ADNey15R418K+JtR8UaZ4l8NywJJYQvHiYEglz6fSgD1OVo0id5i
AgUliemMc5r5q8Fz6LB8N9WbXppINMuNTlWHyiQzqSMImOeWB6V2V54Z+JfiSE6dreqQWlnJxKLZ
MO69wD2zW14i+Hdre+ELXw1oji1bTpY57ZiMjzI8nLeuc80AeR+Nxo9v4Ulu9F8N3OnSW3lyQ3pA
QoQ68k53HPTmup+KGm6ffWHhjVLmBHubq/s45ZCOWRlJKn2zV7xD4T+InjHQZ9I1m6trdMKVSEH9
66sCC57Dvgd8V1fjHwbe+IfDNhp1lOsF7p0kE8TkZXzIVxg+xoAXxja+EdE8LHTtS3WdhLKqiK2y
GkcnOwAc845rxzxwdKtfDwvdG8OXGly20kTRXhATb8w685OfevVPEHhLxH4s8N2qanPDBq9jci5i
eMZi3J0BHuKwvEXhL4heMtGk0/Wrm2t1QqyRwg4kZTnLH09qAPZrCV57C3mkOWeJGP1KgmvF/Fmj
anb+OX8Q6hpLa3pb26RxxoQTAy/eOwkA5r2qyha3soLd+WjjRD9VAFcFrek+N7XXJNY8NXkcsE6B
XtLnOxWH8SEdM96AOX0TVPClhZeINS8LJLZ30FnJPLYyAqEaNCVYIeOT1xXGeD7fTbvw5Fear4au
tVub5TLNdttbeXJPyktkAdulep+HPBeo/wBs6j4l8VSRS3eoW/2UxQjEaQ9x7k461i6b4Y+IXhKF
tE8N3NtcacGYwG4B3wqxzjjrigDkxBrll8JfEmnaxbzQRQNJ9jE5BfyGIKgkE5xXa6f8PvDF14Hh
e8tVmuJbFJGnYkybzGCCGzxjtWne+DtauvAd/wCHbu+N5qF8rFppOFDMRwo7KO1dnY6dLbeHoNJc
gyR2iwEjpuCBc/nQB4XBHFrnwGe91ZBcT2lpP5Uj8spQkAg+uK9c8DaPpemeHrObT7dIXuLeJpCg
wWO3qaw9B8DXNp8OJfBV/KvmzQzRF15A8wkg/hmtbwPp/inSdOGmeIpIZUtkSOB4gQSqjHzUAdxR
RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF
FABRRRQAUUUUAFFFFABRRRQAUUUUAYfiMY0G9x/zyapPD/8AyA7H/r3j/wDQRVjVLNr/AE+eyUhT
MhUE9BmqZ0y6TQU0u2m8uZIkjEg9Vxz+NAG0zKil3OABkk1xUxl8VXQgiyNMhbLv085lPQe1aGqa
PqV9o8WmxXW1wFEshH3wBz+ZqlBpHie2hWCC+hREGABHwBQAmsBYvE+kM3EeJEX0DYGBWp4rZF8O
3u/vEQPqelP1PRm1Swihmk23MO1llUdHA649DWW2i61qLxRaxco1vEwYqgwXK9M+1AHS6arJp9us
n3hGufyrldWtor3xTBaTDKS2cin8TXbAADA6CsabS3l1yDVg4CxQtGVxycnOaAOdstak03QLmC5O
bqwJgA7sx4jP4/0qpa6cdM1jQbd+ZWS4eQ+rsmTW5e+Gku9ch1XfiNSrSR4++yZ2n8M1o3mlvc6x
Y6mHAW0EoK+vmLj9KAMey/5HDUf+veP+lYnhmw1S5sp5LO9Nun2mUbQoPORzk12MGkvDrd1qpcFb
iJYwuORt71hWWgeINNSSGxvY0jeRpMFMnLH60AGlpPpGv/ZNQInlvIyyz/xYT+EjsK7muZ07Qp4b
/wDtTUrg3NwFKJxhVB64FdNQAUUUUAf/0fqiiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigD//S+qKKKKACozKgOCakooAi86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1
o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPO
j9akooAj86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1o86P1qSigCPzo/Wjzo/W
pKKAI/Oj9aPOj9akooAj86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1o86P1qSi
gCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj
86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj
9aPOj9akooAj86P1o86P1qSigCPzo/Wjzo/WpKKAI/Oj9aPOj9akooAj86P1o86P1qSigCPzo/Wj
zo/WpKKAP//T+qKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooo
oAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACikpaACiiigAooooAKKKK
ACiiigAoopCyggE8noKAFooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigD//U+qKK
KKACvLtf1rU7X4maDo8E7JaXNvM8sY6MVzgmvUa8a8T/APJX/DX/AF6z/wAzQB7LXL634z8M+HZl
ttXvY4ZWGQnLNj1IGcV1FeIzazof/CS6m3hzQZdZvRII7uf5diuv8AZ/T0FAHp0Hinw/c6PJr1ve
RyWUQJeVTkLj1HUdfSuD+H/xKsfE095YX9zH9q+3zxWkaqQXgQAo3TuM1gfDMvN4y8W2NzYixif7
JI1mSGVGdG3dOPm61o/CO0tUsvEFyIU8yLW70I20ZAATAB7CgDvtb8ceFvD1wLTVr6OGYjOzlmA9
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
1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ
6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2
mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH
2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xet
FgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xe
tH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBPRUH2mL1o+0xetFgJ6Kg+0xetH2mL1osBP
RUH2mL1o+0xetFgJ6Kg+0xetH2mL1osB/9f6UoooqwCiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKAP/0PpSiiiqAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACi
iigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA//R+lKKKKoAooooAKKK
KACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigA
ooooAKKKKACiiigAooooAKKKKACiiigD/9L6UoooqgCkZgo3MQAPWlrk7+F9X13+zJHZba3hEsiq
cb2ckAH24oA6lJI5PuMGx6HNOyCcZ5HauJ1Swi8PeTqumFo1WVEljySrI5x09RVO6nvrbxNe6jbE
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
6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHm
N/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D
+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5
jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS
0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP6UAS0VF5jf3D+lHmN/cP
6UAS0VF5jf3D+lHmN/cP6UAf/9H6oooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooA//
0vqiiiigApCQBljgClrwz4lXTXvjDRfCup3j2OkXcbyTMreWJHBICFu3SgD2yK4gnyIZEcjrtIOP
yqYkAZJwK8Y1P4WwWMMWqfD+4ey1GFlZSZXaKRc8q/J6iqvxQv7uTVfDvhvUbtrDTtRZ/tk0bbAx
UDCbuwJ/nQB7XHc28zFYZEcr1CsDj8qmJA6nrXi+p/Cqwgs01HwJcSWWpQlWhl85mRxkZD8nIIpP
Hk18niLwOty22Z74CYITtLYXcPcZ6UAe0FlHDECgMp6EGvA/GOi2niT4taboupNJ9mfTpHZY5GT5
lLEcqRWjq/wubRLOTVPBOoXVne26mRUaVpI5NvJVgxPWgD22ivP9F8eadP4Gg8X6u4gQRgTgDkSq
drKB3JboKz7f4paabi3j1PT77T4LpwkVxcRbYyzfdBPbPvQB6hRSAg8iloAKKKKACiiigAooooAK
KKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAoo
ooAKKKKACiiigAooooAKKKwPEt81jpErRf62XEUY/wBp+KANxJEkXdGwYeoOafXDeF45dHv7jQJ2
LZRZ4ye4Iww/A1t6pr9vpN3BazIzmdWK7eTkdBj1NAG9RXLQeJT9tis9QtJLUznEbMQQx9PY1p2m
qx3OpXWmFCklttPJ4ZW7igDWorJbVYxq6aQiFnMZlZgeFHbP1qxqUk0WnXMlv/rFicrj1A4oAkkv
bOF/LmmRG9GYA1ZDBhlTkHvXnfhzTfD+packlyVuLuQZl3t84Y9eO1dLo+l3OkJcQibzYCS0CtyU
HpmgDYmu7W3IE8qRk/3mAqVHWRQ6EMp6EcivNvDdtpGqxyy6wyy3zSMHSU8rzwAD/Sup0nRZNJu5
zby5s5VBSI5OxvY+lAG+ssbKXVgVGckHgYqIXloeBNH/AN9D/GuI8PEnw1qRJ5864/kKTw54c0i+
0K1ubmItJIhLNkgk5IoA9ABB5HIpa4a0im8O65Dp6SNJZXoYIrnJR15wD9K7mgAooooA/9P6oooo
oAK4rxFb+D/El8nhPXljmumjM8cbAhgucblbsfoa7WuK8WeBtL8VvBdzvLa3trnybqBtsiA9s9xQ
B5X4r8I3vw10iXxR4R1a4hjtGVntJ3LxSKWA2gHvzXpF/d+E/FNvp+geJEja41G3W6igkBB5HJVu
xHPfNYqfCtL2eJvE+sXmrQQsGWCVsRkjpuA611PinwRo/iuCBbrfbz2hzb3EB2SRfQ+ntQB5b4o8
D3HgDSLnxP4O1W4tBZDzWtpX3wuoPK4Pc9s5qfxVqT6xqPw81WVPLe7uY5mX0LohI+nNdB/wqr7c
6R+JNavdUtY2DC3kbajY6bsda7HWPCOnaxfaReyM0X9jSiWFI8BTgAAHjpx2oA4XUv8AkuGlf9gy
b/2avTte1Wx0XSLnUb+RY4oY2JLHGeOAPc1yfif4eW3iTW4NfXULuwuoITCrWzBDtJJPOM85rMh+
EukTTxza7f32rLEdyx3UxZMj1HGaAOX8O+E4tc+E8Gm6nP8AYXvJ2vIHbA2u8hePg4z16Va1bXfG
vg6xjm8aWlnqulRuiPPD8siZOAxRuD+Feq6/4a0nxFpB0S/jxb/Ls8s7TGU+6VI6Edq4yP4Xw3Ek
Ca7q17qdrburpbzuPLJX7u7A+bHvQB6fE6yRq6fdYAj6GpKaoAAA4A4p1ABRRRQAUUUUAFFFFABR
RRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFFFABRRRQAUUUUAFFF
FABRRRQAUUUUAFFFFABXAa897qWv22n6cqSGyHnuHJ27j0ziu/rNtNLtrO7uL2LcZbkguSc9OgHt
QBw+qvrlnf2eu6jHCiQOI3MRJJR+uc9hWvquyTxVpDdRslI/Kunv7KDUbSSyuRmOUYb1qqNHtRPa
XJLF7NCkZJ6gjHPrQBi+L+I9ObuL2Ln86XWANN12x1jpHLm2mPs3Kk/Q1v6hptvqSxLcZ/cyLKuO
PmXpXOeLLhLy3bQreNpbmbZtwpwoz94npxigCbw2hu7m+1x/+XmUxxf9c4+Bj6nmulu7mKztpLqf
PlxqWbAzwPao9Ps47Cyhs4+kSBfrjqfxPNWXRJEaOQBlYEEHoQaAOXk8PeH9ZiW+gQL5o3CSI7Tz
34ql4cvLi2udR024ma4hssFJDycYOR74xVs+ELFGb7LPPbo3JSN8LW3pulWWlQGCzTaGOWJ5LH1J
oAxjpfh3xLCL+NAxfPzr8rZHrjv9aoaI1xp3iC40JZ2uLdYfNXcclDkDGfxrRm8J2Bmea0lmtd5y
yxPtU/hWnpmi2Okq/wBlUl5PvuxyzfU0Acp4d/5FrU/+u1x/IVueESP+Ebsv9w/+hGr9po1pZ2c1
jDu8udnZsnnL9cVjJ4M0yNBEstwEHAXzDjFAEWoTpqXiaws7Yh/sm6aUjkLxgD6812lZmm6Rp+lR
mOyjCbvvHqx+p61p0AFFFFAH/9T6oooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiig
AooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAC
iiigAooooAKKKKACiiigAooooAKKKKACiiigApMDOaWigAooooAKKKKACiiigAooooAKKKKACiii
gD//1fpz7Uf7n60faj/c/Wq9FVYCx9qP9z9aPtR/ufrVeiiwFj7Uf7n60faj/c/Wq9FFgLH2o/3P
1o+1H+5+tV6KLAWPtR/ufrR9qP8Ac/Wq9FFgLH2o/wBz9aPtR/ufrVeiiwFj7Uf7n60faj/c/Wq9
FFgLH2o/3P1o+1H+5+tV6KLAWPtR/ufrR9qP9z9ar0UWAsfaj/c/Wj7Uf7n61XoosBY+1H+5+tH2
o/3P1qvRRYCx9qP9z9aPtR/ufrVeoLm5t7K3ku7pxHFEpZ2boAOposBf+1H+5+tH2o/3P1rxWf45
+BIJWiEk8gB+8keQfzIqH/hfHgT1uv8Av0P/AIqloB7h9qP9z9aPtR/ufrXh/wDwvjwJ63X/AH6H
/wAVR/wvjwJ63X/fof8AxVGgHuH2o/3P1o+1H+5+teH/APC+PAnrdf8Afof/ABVH/C+PAnrdf9+h
/wDFUaAe4faj/c/Wj7Uf7n614f8A8L48Cet1/wB+h/8AFUf8L48Cet1/36H/AMVRoB7h9qP9z9aP
tR/ufrXh/wDwvjwJ63X/AH6H/wAVR/wvjwJ63X/fof8AxVGgHuH2o/3P1o+1H+5+teH/APC+PAnr
df8Afof/ABVH/C+PAnrdf9+h/wDFUaAe4faj/c/Wj7Uf7n614f8A8L48Cet1/wB+h/8AFUf8L48C
et1/36H/AMVRoB7h9qP9z9aPtR/ufrXh/wDwvjwJ63X/AH6H/wAVR/wvjwJ63X/fof8AxVGgHuH2
o/3P1o+1H+5+teH/APC+PAnrdf8Afof/ABVH/C+PAnrdf9+h/wDFUaAe4faj/c/Wj7Uf7n614f8A
8L48Cet1/wB+h/8AFUf8L48Cet1/36H/AMVRoB7h9qP9z9aPtR/ufrXh/wDwvjwJ63X/AH6H/wAV
R/wvjwJ63X/fof8AxVGgHuH2o/3P1o+1H+5+teH/APC+PAnrdf8Afof/ABVH/C+PAnrdf9+h/wDF
UaAe4faj/c/Wj7Uf7n614f8A8L48Cet1/wB+h/8AFVJF8dfAkkgQvcJnu0fA/I0aAe2faj/c/Wj7
Uf7n61l6ff2mqWUWoWEglgmXcjr0Iq5TsBY+1H+5+tH2o/3P1qvRRYCx9qP9z9aPtR/ufrVeiiwF
j7Uf7n60faj/AHP1qvRRYCx9qP8Ac/Wj7Uf7n61XoosBY+1H+5+tH2o/3P1qvRRYCx9qP9z9aPtR
/ufrVeiiwFj7Uf7n60faj/c/Wq9FFgLH2o/3P1o+1H+5+tV6KLAWPtR/ufrR9qP9z9ar0UWAsfaj
/c/Wj7Uf7n61XoosBY+1H+5+tH2o/wBz9ar0UWA//9b6UoooqgCiiigAooooAKKKKACiiigAoooo
AKKKKACiiigAooooAKKKKACiiigArE8R6OniDQrzRZHMYu4jHvHUHqD+YrbooA+Mbj4B+M0lKwSW
siA8MXZcj6bTUP8AwoXxx62v/fxv/ia+1KKLAfFf/ChfHHra/wDfxv8A4mj/AIUL449bX/v43/xN
falFFgPiv/hQvjj1tf8Av43/AMTR/wAKF8cetr/38b/4mvtSiiwHxX/woXxx62v/AH8b/wCJo/4U
L449bX/v43/xNfalFFgPiv8A4UL449bX/v43/wATR/woXxx62v8A38b/AOJr7UoosB8V/wDChfHH
ra/9/G/+Jo/4UL449bX/AL+N/wDE19qUUWA+K/8AhQvjj1tf+/jf/E0f8KF8cetr/wB/G/8Aia+1
KKLAfFf/AAoXxx62v/fxv/iaP+FC+OPW1/7+N/8AE19qUUWA+K/+FC+OPW1/7+N/8TR/woXxx62v
/fxv/ia+1KKLAfFf/ChfHHra/wDfxv8A4mj/AIUL449bX/v43/xNfalFFgPiv/hQvjj1tf8Av43/
AMTR/wAKF8cetr/38b/4mvtSiiwHxX/woXxx62v/AH8b/wCJo/4UL449bX/v43/xNfalFFgPiv8A
4UL449bX/v43/wATUkXwE8au4WR7VFPU72OPw2ivtCiiwHMeDvDw8K+HLTQ/M80wKdz+rMcnA9K6
eiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKACiiigAooooAKKKKAP/9k=

--Apple-Mail-F6679553-3489-4DC6-8B4C-268C7CE2DFFC--

--Apple-Mail-2A7D87EA-5949-4369-92BA-FA6C9AE9BF7F--

--===============3342487397154918318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3342487397154918318==--
