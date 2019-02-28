Return-Path: <SRS0=YN3W=RD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047BDC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 19:57:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0C15218CD
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 28 Feb 2019 19:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0C15218CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dkisselev.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd2f05ee;
	Thu, 28 Feb 2019 19:47:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 583a71fc
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 19:47:13 +0000 (UTC)
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-oln040092002108.outbound.protection.outlook.com [40.92.2.108])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f36942cc
 for <wireguard@lists.zx2c4.com>;
 Thu, 28 Feb 2019 19:47:13 +0000 (UTC)
Received: from SN1NAM01FT008.eop-nam01.prod.protection.outlook.com
 (10.152.64.60) by SN1NAM01HT204.eop-nam01.prod.protection.outlook.com
 (10.152.64.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1643.11; Thu, 28 Feb
 2019 19:56:51 +0000
Received: from CY4PR14MB1141.namprd14.prod.outlook.com (10.152.64.57) by
 SN1NAM01FT008.mail.protection.outlook.com (10.152.64.199) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.1643.11 via Frontend Transport; Thu, 28 Feb 2019 19:56:51 +0000
Received: from CY4PR14MB1141.namprd14.prod.outlook.com
 ([fe80::191b:fdab:674e:4abb]) by CY4PR14MB1141.namprd14.prod.outlook.com
 ([fe80::191b:fdab:674e:4abb%7]) with mapi id 15.20.1665.015; Thu, 28 Feb 2019
 19:56:51 +0000
From: Denis Kisselev <denis@dkisselev.net>
To: "STR ." <strykar@hotmail.com>, "wireguard@lists.zx2c4.com"
 <wireguard@lists.zx2c4.com>
Subject: Re: Help calculate MTU, ISP's 1448
Thread-Topic: Help calculate MTU, ISP's 1448
Thread-Index: AQHUzdBdEG2NAOrQUEeABRiQoQDZLKX1ox61
Date: Thu, 28 Feb 2019 19:56:50 +0000
Message-ID: <CY4PR14MB1141A575E3180794D7155EB3A2750@CY4PR14MB1141.namprd14.prod.outlook.com>
References: <DM6PR12MB3401FF1DE04A62EAD84F2C74BB7B0@DM6PR12MB3401.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB3401FF1DE04A62EAD84F2C74BB7B0@DM6PR12MB3401.namprd12.prod.outlook.com>
Accept-Language: en-US, en-CA
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:62A768DACFFF95C5949CEFEE98BB61B6791397533C870AD6869D51E306A03CD6;
 UpperCasedChecksum:7A89A86E5616C922AE4C58467226420689664B9D6FA2907A5799617E1BEC822F;
 SizeAsReceived:7010; Count:44
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [AnGhm5SKPw5ZtMdhLZLgHArVdPJEP5HMDRrdKjErkonvRcJdfp2jCROpzT6rkWuj]
x-ms-publictraffictype: Email
x-incomingheadercount: 44
x-eopattributedmessage: 0
x-ms-exchange-slblob-mailprops: YewVvtVTBeLzMM8CVDgXyqHq3WF/2Y71pq7tc+E7AFxtecQhOwBHIPXJo4vBJxAF22oa/A9rHy22YS+o4Ol9mCdHGdLdVcual0XmJUHwg+ndmqGu08dMsJ8LvutGUedrFNv6/ZteDlgjLwtmkxd5wdeCAKMS7oTJMzZTZd2ayV8lXNSnXZ/ibJ6iIleS4oC8M0cBTycIY5sNmmUjixb7Uxt5M7EQWdSMZNK5vU91d4wGqvK5BwzN03wMP4tCW9JEHj+Vlee4pErx1IuWXWA7FQwQ8Yzy3101dQzB70muv+kW2jgWVOWvt9V26kq9Mxp6Yf1cb/HzQv9zqz8RzBDmpepLbWSidZAOQm+aDvcAPdUUbIeNtYX+cSshPtRkOKdPP2d/vo6cBRai+/8UlH5eiGzksoMcZ6MOEmcA9/ocC2RwyjeQWI6AkQPOwy1K3hyDN/SCBG9/WIu3CYLIVvBVN8/M4wgkXRDgxojDisw0mihmyWNjM6mrCrXZX44rPcNhsWyN5VC4g+2aP5VZpNmYWGQNZL9hckX7OlabpXzU4DIQkHTPusptIgFEmMFb070e03HTGp8KC6xAdb3OnD0MEKUac9xbbWFK3IUY7kYw+H3/W68+nkpe6yzkbUekIOMwV0nAp0S6tW42+ReOq+uyhSv0NtpNc4tsO30vf69xjtEN2U6IbhMyMi7gMNX4gub6JudS5LcCTR/cRdbjP/2VJwMbNCAL6AiTDwchIBT4NSPvPx4Aj9B50p9MoC1qFzMML1cpGjE7oZSDOjsqtCcuM+ANT9HXltjtpid83f+JLslbSCTsA3qHliYV3wqrsPJ5ZfOLhXFnd+b/ob+yOInfyYeTyRU72RywWTDWTnAjXjZM9pd3tK3enucYcY+ryHDYuchjsjcUAtZlsieIIEc98LVGn6FGsjSy
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(201702181274)(2017031324274)(2017031322404)(2017031323274)(1601125500)(1603101475)(1701031045);
 SRVR:SN1NAM01HT204; 
x-ms-traffictypediagnostic: SN1NAM01HT204:
x-microsoft-antispam-message-info: bhfEo8DwkqvEiiui4rMt4TpaEvVT4vjF5THDIQlIy/SGIeuyO000mXFVW/i6hDdW
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2d845d-ec4b-4a44-c40f-08d69db6e16a
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2019 19:56:50.9982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM01HT204
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
Content-Type: multipart/mixed; boundary="===============3643982907887243055=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3643982907887243055==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CY4PR14MB1141A575E3180794D7155EB3A2750CY4PR14MB1141namp_"

--_000_CY4PR14MB1141A575E3180794D7155EB3A2750CY4PR14MB1141namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Check what IP's the google domains are resolving to.

You might be getting IPv6 DNS responses back and your VPN/firewall configur=
ation is blocking them.
I've run into the opposite issue where my ISP's IPv4 stack crashed and Goog=
le/Facebook worked (over IPv6) but most other sites failed.
________________________________
From: WireGuard <wireguard-bounces@lists.zx2c4.com> on behalf of STR . <str=
ykar@hotmail.com>
Sent: Tuesday, February 26, 2019 4:39 AM
To: wireguard@lists.zx2c4.com
Subject: Help calculate MTU, ISP's 1448

Hi,

I have Fiber to our apartment complex basement, from there Cat6 runs to
each apartment. The ISP/apartment service provider suggests an MTU of
1448, which I set for the PPPoE interface on my OpenWRT router.

I read
https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.html
which comes to (assuming 1500 byte MTU) to 60 bytes (IPv6) to 80 bytes less=
 to account for Wireguard protocol overhead.

Using this info, I tried an MTU of both (1448-80=3D1368) and (1448-
60=3D1388).
As my ISP assigns only IPv4, I expected an MTU of 1388 to work, which I
set on the Wireguard interface in OpenWRT.

However, when set to 1388, almost everything works except any Google
related sites like Maps, Gmail, YT etc.
When set to 1368, everything works and it's the way I have it setup
right now.

What am I missing here?
Why won't Google sites load via my WG VPN when the MTU is set to 1388?

If it helps, I host the WG server on Google's cloud platform and was
informed that GCP has an MTU of 1460 bytes.

Thank you,
S

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--_000_CY4PR14MB1141A575E3180794D7155EB3A2750CY4PR14MB1141namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
Check what IP's the google domains are resolving to.<br>
<br>
You might be getting IPv6 DNS responses back and your VPN/firewall configur=
ation is blocking them.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);">
I've run into the opposite issue where my ISP's IPv4 stack crashed and Goog=
le/Facebook worked (over IPv6) but most other sites failed.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> WireGuard &lt;wiregua=
rd-bounces@lists.zx2c4.com&gt; on behalf of STR . &lt;strykar@hotmail.com&g=
t;<br>
<b>Sent:</b> Tuesday, February 26, 2019 4:39 AM<br>
<b>To:</b> wireguard@lists.zx2c4.com<br>
<b>Subject:</b> Help calculate MTU, ISP's 1448</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
I have Fiber to our apartment complex basement, from there Cat6 runs to<br>
each apartment. The ISP/apartment service provider suggests an MTU of<br>
1448, which I set for the PPPoE interface on my OpenWRT router.<br>
<br>
I read <br>
<a href=3D"https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201=
.html">https://lists.zx2c4.com/pipermail/wireguard/2017-December/002201.htm=
l</a><br>
which comes to (assuming 1500 byte MTU) to 60 bytes (IPv6) to 80 bytes less=
 to account for Wireguard protocol overhead.<br>
<br>
Using this info, I tried an MTU of both (1448-80=3D1368) and (1448-<br>
60=3D1388).<br>
As my ISP assigns only IPv4, I expected an MTU of 1388 to work, which I<br>
set on the Wireguard interface in OpenWRT.<br>
<br>
However, when set to 1388, almost everything works except any Google<br>
related sites like Maps, Gmail, YT etc.<br>
When set to 1368, everything works and it's the way I have it setup<br>
right now.<br>
<br>
What am I missing here?<br>
Why won't Google sites load via my WG VPN when the MTU is set to 1388?<br>
<br>
If it helps, I host the WG server on Google's cloud platform and was<br>
informed that GCP has an MTU of 1460 bytes.<br>
<br>
Thank you,<br>
S<br>
<br>
_______________________________________________<br>
WireGuard mailing list<br>
WireGuard@lists.zx2c4.com<br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard">https://list=
s.zx2c4.com/mailman/listinfo/wireguard</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_CY4PR14MB1141A575E3180794D7155EB3A2750CY4PR14MB1141namp_--

--===============3643982907887243055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3643982907887243055==--
