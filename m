Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95053C00140
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 24 Aug 2022 05:32:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c0cdb54f;
	Wed, 24 Aug 2022 05:32:56 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150072.outbound.protection.outlook.com [40.107.15.72])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id d9ef01f6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 24 Aug 2022 05:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldXjwPqCdyAoau3Uxo15PpTg/vuiLCjA2Mbr35K5dE4YALYCIAp0TJW+eBjpmKGWbuEu8BS/Afesj7BSFsDKoBdBHX82eVQTFrLByjpz39hfKfH6OgN415cLajwJExsZqpwKTrL+0QmP7yoYE5LUN1xOs+djjZkNXQKceO6Ye0PFGOasuW1nKIUVH4tyVw+cNgGGVLxClB8repH+6OIK/qHwlM8agui/2my0OXPiQPXeaJLX6lH+V/imWPtXRWFLY61FZ6BprVwX1pzWn9JiPktan4Zmept3fN3tgnMun0VeOQhDIGiHpRYF9ssa1/Utr9t8nF3NUmIFRtM4jg/qtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0od+Su9CDGTblww2l6H4Z0M5Abc8Q6XcsCHY2zzbq8=;
 b=hNGY3xOkfULRu2Atd4NlBk31kkG9WXhfDJXfQLw/YUc4jBt64/xGOcA/YkqKcpzCaXidUvhdOHCcpp2a6btZ+2aOGdd86ltsboLP+1qbJuj3Z+deB7O/KcYX/BfrIia1ZHTOUPfgI09n4e8tf6EUUWRgfguAiK1dca2eaKqViHL408yUjsr/XVh8oWdfP43HB2Iyyj18T4U/AAgqC/0jOdo0Gy1qg9YXTw4+GfgPsyL/UtqcP5ljIyrbou22LCBUrFG+uQilj8fcMGKN1rFa4NngTkdvIBt2rmWMHtUSd87bL3K82ZmTrYD8ZFIxVplclil2BCAMM5v6sg0JVktb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rte.se; dmarc=pass action=none header.from=rte.se; dkim=pass
 header.d=rte.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtesweden.onmicrosoft.com; s=selector1-rtesweden-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0od+Su9CDGTblww2l6H4Z0M5Abc8Q6XcsCHY2zzbq8=;
 b=kNOehIxg7h2IO3lmfCwb8LPyskN9+5XdUu3Q8Mgwp4/mJF75R2RdbbhaI3C7sYYF3f+oOSfRkpvA0KxgsYGAJ1gDHaD7F2eFKswqS5Pnr5GyGp00T+nwVjvWTHSgMRMRNFQuspArwndIw+YbmxhwuD36nsx4pYIDSgE7VtYnLmNpPuHtu+DHZnA23rZjJ0TAVtVWxAXlrVT96Zs65xAef6WVZAhGbuoVuyYISSmHahYqL985m8IlF+2EuYL3gUlE+hPHvhcggKKMJKQE4QnLDNqyIPbAMhGwj3b/WnTyglKrq/emKdcmx2tr62BpYD1HGnuBVyQpQJWnOVZNAdB6gQ==
Received: from VE1P189MB0989.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:14b::14)
 by AM8P189MB1298.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 24 Aug
 2022 05:32:52 +0000
Received: from VE1P189MB0989.EURP189.PROD.OUTLOOK.COM
 ([fe80::89f7:4587:1f0d:5034]) by VE1P189MB0989.EURP189.PROD.OUTLOOK.COM
 ([fe80::89f7:4587:1f0d:5034%9]) with mapi id 15.20.5546.024; Wed, 24 Aug 2022
 05:32:52 +0000
From: Mats Loman <mats.loman@rte.se>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Re: Endpoints are not in sync (latest handshake)
Thread-Topic: Endpoints are not in sync (latest handshake)
Thread-Index: AQHYstzqaN50zUSMf0uspv91Jh9xxK29jkDA
Date: Wed, 24 Aug 2022 05:32:51 +0000
Message-ID: <VE1P189MB09890F6F771E425EC0743C25E5739@VE1P189MB0989.EURP189.PROD.OUTLOOK.COM>
References: <VE1P189MB0989ABC50A06400CFC34F398E56D9@VE1P189MB0989.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <VE1P189MB0989ABC50A06400CFC34F398E56D9@VE1P189MB0989.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rte.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 151e1fd9-f306-4f8f-febb-08da859216c3
x-ms-traffictypediagnostic: AM8P189MB1298:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2cTPtmSZ5Il5EdsAws4QjGgyJ4g2LG1nsiM0i41tsgtrbo6eNlfVNI6TpKBb2VMuWAN38+S/nVjdM5gCEnVZKRxrgq5pRGfHQopEJTiifVcizawkjlaBRANbDAKYQ0bUrqk1GJRIDYKYkCnieMZ/OMV4GOjV9tieIjqjpXFj2AcLCoDGBwA8x8JUWCk8XOwEmcFTTNTVYU/ZHyivi6INrwnxfeol2R7c7wj5mCQ0vo2F5K5Shgg8IBBmZpl3AHTmGvWOyec32XEBbmNE2nmEweFnQMstxYUqmQRVxNNeprQxZKqlaU4GodwxZxYFV429xKY0+PzpFubgQcw8EX/ujzk7b+druTeU6gGBZVQrHfJODRGDohDvaDMCKzhJqDEQlCMcT5hvyyU9yvPiQc6AThRKV+sXPdGSNTuDx4HHlCwfyfjYDZnNmUwMBh5UuyP8GFYND5CWIGkYb0AGTlCIjz8/i5YC19I2+Qrp8h5v87bAZ9gwkW8QYfWrbvGx7qoBZ8lllhguXfXvjCZF1+FLqKwN4IHDW88D5CWyPA3D1AK05MXLS6pFQXGyRIam8TxYJIrB0qyYoodBsSf5govjRKviMILS1AZ9Nod4C37EQkURP4H1m1C7GRhOxrCcs1MTeQ0W5z/PtklnVN8BuOMGFXFN3jhX0VJ+Z5VMyqI3fjEeJTcPJ76pOHkPlxqNWvJGqTUeST3qs247hY2QViIPSb8R6hPpVjd19pkub5z4N5w3bkUGQJEDOKh6nkAM2kQ3S+RrM1LVPVdx75buKVpQA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1P189MB0989.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(39830400003)(136003)(376002)(346002)(26005)(2906002)(5660300002)(55016003)(8676002)(91956017)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(316002)(478600001)(6916009)(9686003)(33656002)(6506007)(7696005)(71200400001)(41300700001)(38100700002)(38070700005)(86362001)(186003)(122000001)(8936002)(44832011)(52536014)(83380400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QlxHHp/T76Md+Abt6OhU9J2nQJORqOefz98qwbWlBrcC2U/MTGnyPyhqUk?=
 =?iso-8859-1?Q?s9JkbCQUWFRCIJqvCScQk5w5Qme7dpXMOVeuWx/Wojd9XgO8XhGhQvNq+a?=
 =?iso-8859-1?Q?5MU9jiuQvbKzuSpZ4sfvkqXzMq93IaJW1DLlN5QNM7ijgTDpRi3MW27L71?=
 =?iso-8859-1?Q?Qg4mp4cdeWI13fKpXc1RLP0G0MqgjVpLHR7GSHZW2gsHbwBUIHS0iGsT0V?=
 =?iso-8859-1?Q?rdwUEC767ojV1tLAuegdXeNbj/v4JCzYL+TsefvcwsByG+zYVnt89FJOPk?=
 =?iso-8859-1?Q?8y83b7FCH02faqoVDvwQQUHN+lkQQBeoYgQp1T5bxcMDk4G0RVawoZOOKs?=
 =?iso-8859-1?Q?FjOfn01SQu1qVKONdn4JESNacfAQFLU0h5Gdq+RjH5eU4Et6pBFlH4z0jw?=
 =?iso-8859-1?Q?PxKblqiry2eEe/qitHpXQQ99BzcoMNHoJ1p+ZSs3hsGetO04GWkFlGQJk9?=
 =?iso-8859-1?Q?Ej3tF3QSPWjlF5aD8kYhtFIOl6syRDe4uOiOklsbyQHfjMuJTdZSJ3oHsH?=
 =?iso-8859-1?Q?FPTC+xymYjtTB+FzCKDagNDup6ol4RZfHmV7j2jCf/g1Rt4ELQ+X/WG72N?=
 =?iso-8859-1?Q?h3kA2f7Jh0YfIehfa+il83HQwfKoUOMX1Mq9lE2oTmXQXHY+Cl4XH3ays8?=
 =?iso-8859-1?Q?uM+cQ40sZctX8P1TmSONPIl+IosH5ruwOli6YbLb7CFDIRRhii0nv7TS+w?=
 =?iso-8859-1?Q?kdTG+gt2sNXinIDFtJQhN5vFa4YgIUjnyC5JgttWig84FS85WprmizYX9O?=
 =?iso-8859-1?Q?uNTzhvZK8qP6aOVqXWwnwdve13zpqfqVIrTaQROtKNxVt/An9bNt+Jf2Gl?=
 =?iso-8859-1?Q?J3MbzNwKE9JHszyHQ7LXNIcd7bg3xnd+O/lo+kmbXZoJ10hZIjTfDELi6r?=
 =?iso-8859-1?Q?eG71Xivhzn/9ydfxwxeVlvQ29hBI3lzwjXuoRjLp2yyLL9DQOIY0C0+bfM?=
 =?iso-8859-1?Q?9pGsoDRjdruV/E7ODczTK/w70KNkVYQn9YXjrVmmkIpcORcICZaa5m3GIu?=
 =?iso-8859-1?Q?yOfySf7+VH6qhzLB3RJi7haCllzVRFv56Jgtd/vspNLcdNFxOuQ+eH/IF9?=
 =?iso-8859-1?Q?i23cTsH2nTcTVdeShaYnz1VYdXFczK7KpReYuvAoMNU9LztvSMhL6TB48f?=
 =?iso-8859-1?Q?nDoW36RQ/sWDhQn6NiSG/D09vDDIUDJPkLf1fJOco/dVdHh3yxKVXcd1AI?=
 =?iso-8859-1?Q?5T/gKUNaD67xzWH26QXYoi4AayWodn8b4OqClZoBw1v/quYniejgr985M5?=
 =?iso-8859-1?Q?wQYBv5BiDHDuL/12uK3ZwiIhwvpH+Qgqdu+/U3RdwZV3IE/KhY2aaudcgf?=
 =?iso-8859-1?Q?T3fUs6+RYPtY2TeeHD2M5H8kp3drGXB1oMmjL1dxPEF+UP5rwaSO843eya?=
 =?iso-8859-1?Q?S6g6In+jX+7pjTA1b5c0kJtuLLCjwdJy+aoxx9wyp6gHnBu41RjeD2B+Xb?=
 =?iso-8859-1?Q?F68xVpPfRHBk0tKXsm/L88NmdplI4ftnSr3pHy1JvrXsKGnpbvgXS+MtGc?=
 =?iso-8859-1?Q?JAfGh5oLIlhVjpIIq6sxgTqUveKNDvihwHggB+d9fAjXK8dTzFPht2/vC2?=
 =?iso-8859-1?Q?JZ20ufHT1QrVNXXHk2gY176I7fcjRTrbPYje7KnwBdJtUEiIAYDFZt5EMp?=
 =?iso-8859-1?Q?EwIAiFVR6QCQs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: rte.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1P189MB0989.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 151e1fd9-f306-4f8f-febb-08da859216c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2022 05:32:51.9696 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cd53aeee-83dc-41cc-adaf-1e216ce7f7ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZKJIBv39oOkgVuRi+E2+q4zZgKPrzEt8xN7qawE/xNTHeigfBd08pkB+FzTnrlra0QtuvYLMG1TQdWvZ1KWxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1298
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

=0A=
> I have two wireguard endpoints that has different opinions about when the=
 last handshake was made:=0A=
> =0A=
> interface: wg0=0A=
> =A0 public key: PauftxCvmti7CDDZ9yj6EKZ+r9zQj6gjb9hvP1whzwQ=3D=0A=
> =A0 private key: (hidden)=0A=
> =A0 listening port: 17395=0A=
>=0A=
> peer: s5dnr91F06+AQ/3o5urOM5Dc1f0gzHOsGjwD+AEmwDA=3D=0A=
> =A0 endpoint: 192.168.201.24:17395=0A=
> =A0 allowed ips: 192.168.26.197/32, 192.168.201.38/32=0A=
> =A0 latest handshake: 8 hours, 42 minutes, 30 seconds ago=0A=
> =A0 transfer: 260.73 GiB received, 313.35 GiB sent=0A=
>=0A=
> And:=0A=
>=0A=
> interface: wg0=0A=
> =A0 public key: s5dnr91F06+AQ/3o5urOM5Dc1f0gzHOsGjwD+AEmwDA=3D=0A=
> =A0 private key: (hidden)=0A=
> =A0 listening port: 17395=0A=
>=0A=
> peer: PauftxCvmti7CDDZ9yj6EKZ+r9zQj6gjb9hvP1whzwQ=3D=0A=
> =A0 endpoint: 192.168.201.23:17395=0A=
> =A0 allowed ips: 192.168.26.200/32, 192.168.201.249/32=0A=
> =A0 latest handshake: 2 minutes, 15 seconds ago=0A=
> =A0 transfer: 282.13 GiB received, 276.13 GiB sent=0A=
> =0A=
> It is not possible=A0 to send data through the tunnel=A0 in both directio=
ns only in one direction.=0A=
> =0A=
> It is pretty easy to repeat this situation:=0A=
> Send UDP packets through the tunnel at a speed that wireguard cannot keep=
 up with. I expect packet loss in this case but not that the tunnel is "par=
tially closed".=0A=
>=0A=
> Any ideas?=0A=
> =0A=
> Best regards,=0A=
> Mats Loman=0A=
=0A=
Adding more information:=0A=
=0A=
One side:=0A=
=0A=
.=0A=
.=0A=
.=0A=
[71254.512872] wireguard: wg0: Receiving handshake initiation from peer 2 (=
192.168.201.48:17395)=0A=
[71254.512939] wireguard: wg0: Sending handshake response to peer 2 (192.16=
8.201.48:17395)=0A=
[71254.527580] wireguard: wg0: Keypair 1399 destroyed for peer 2=0A=
[71254.527642] wireguard: wg0: Keypair 1400 created for peer 2=0A=
[71284.585205] wireguard: wg0: Receiving handshake initiation from peer 2 (=
192.168.201.48:17395)=0A=
[71284.585267] wireguard: wg0: Sending handshake response to peer 2 (192.16=
8.201.48:17395)=0A=
[71284.592697] wireguard: wg0: Keypair 1400 destroyed for peer 2=0A=
[71284.592715] wireguard: wg0: Keypair 1401 created for peer 2=0A=
[71314.024610] wireguard: wg0: Receiving handshake initiation from peer 2 (=
192.168.201.48:17395)=0A=
[71314.024671] wireguard: wg0: Sending handshake response to peer 2 (192.16=
8.201.48:17395)=0A=
[71314.032095] wireguard: wg0: Keypair 1401 destroyed for peer 2=0A=
[71314.032113] wireguard: wg0: Keypair 1402 created for peer 2=0A=
[71344.744295] wireguard: wg0: Receiving handshake initiation from peer 2 (=
192.168.201.48:17395)=0A=
[71344.744356] wireguard: wg0: Sending handshake response to peer 2 (192.16=
8.201.48:17395)=0A=
[71344.751780] wireguard: wg0: Keypair 1402 destroyed for peer 2=0A=
[71344.751799] wireguard: wg0: Keypair 1403 created for peer 2=0A=
[71362.663988] wireguard: wg0: Receiving handshake initiation from peer 2 (=
192.168.201.48:17395)=0A=
[71362.664048] wireguard: wg0: Sending handshake response to peer 2 (192.16=
8.201.48:17395)=0A=
[71362.671474] wireguard: wg0: Keypair 1403 destroyed for peer 2=0A=
[71362.671493] wireguard: wg0: Keypair 1404 created for peer 2=0A=
=0A=
The other side:=0A=
=0A=
.=0A=
.=0A=
.=0A=
[71974.055151] wireguard: wg0: Sending handshake initiation to peer 12 (192=
.168.201.47:17395)=0A=
[71974.076684] wireguard: wg0: Receiving handshake response from peer 12 (1=
92.168.201.47:17395)=0A=
[71974.076775] wireguard: wg0: Keypair 1427 destroyed for peer 12=0A=
[71974.076789] wireguard: wg0: Keypair 1429 created for peer 12=0A=
[71974.076815] wireguard: wg0: Sending keepalive packet to peer 12 (192.168=
.201.47:17395)=0A=
[72004.134540] wireguard: wg0: Retrying handshake with peer 12 (192.168.201=
.47:17395) because we stopped hearing back after 15 seconds=0A=
[72004.134650] wireguard: wg0: Sending handshake initiation to peer 12 (192=
.168.201.47:17395)=0A=
[72004.155991] wireguard: wg0: Receiving handshake response from peer 12 (1=
92.168.201.47:17395)=0A=
[72004.156080] wireguard: wg0: Keypair 1428 destroyed for peer 12=0A=
[72004.156094] wireguard: wg0: Keypair 1430 created for peer 12=0A=
[72004.156121] wireguard: wg0: Sending keepalive packet to peer 12 (192.168=
.201.47:17395)=0A=
[72025.894170] wireguard: wg0: Retrying handshake with peer 12 (192.168.201=
.47:17395) because we stopped hearing back after 15 seconds=0A=
[72025.894294] wireguard: wg0: Sending handshake initiation to peer 12 (192=
.168.201.47:17395)=0A=
[72025.915688] wireguard: wg0: Receiving handshake response from peer 12 (1=
92.168.201.47:17395)=0A=
[72025.915779] wireguard: wg0: Keypair 1429 destroyed for peer 12=0A=
[72025.915794] wireguard: wg0: Keypair 1431 created for peer 12=0A=
[72025.915820] wireguard: wg0: Sending keepalive packet to peer 12 (192.168=
.201.47:17395)=0A=
[72041.893912] wireguard: wg0: Retrying handshake with peer 12 (192.168.201=
.47:17395) because we stopped hearing back after 15 seconds=0A=
[72041.894025] wireguard: wg0: Sending handshake initiation to peer 12 (192=
.168.201.47:17395)=0A=
[72041.915460] wireguard: wg0: Receiving handshake response from peer 12 (1=
92.168.201.47:17395)=0A=
[72041.915551] wireguard: wg0: Keypair 1430 destroyed for peer 12=0A=
[72041.915566] wireguard: wg0: Keypair 1432 created for peer 12=0A=
[72041.915591] wireguard: wg0: Sending keepalive packet to peer 12 (192.168=
.201.47:17395)=0A=
=0A=
=0A=
/Mats Loman=
