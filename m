Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0331BC3F6B0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 23 Aug 2022 13:48:11 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 39d17193;
	Tue, 23 Aug 2022 13:36:01 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 88b5265b
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Aug 2022 08:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8tIAdR21YR3eFhE+w8IJRvnWJK5ss9IbMP20ZFfeIaTfmfs/s99NBm0UhWIFp1D23U6W6p8V0h0DM/d2nRqXAYHUsFEPRF0ikRaQ8yssgZ/VKd8Q1ONx2KWy+n+S7lvSV4bz0oDlydFMsxnfl1WyOK9iXHIRdNjADeIwjWYmCZhJOjbcOPCt8765FuSFX0rZVbbe1lxYTD8t2mduRtO0JfL5bFlZurbW/78Nh2RE6LE5Eu5xocx72Gqj1iTxlFT5Mrsh9DAsL2dlRYvmyk+5GxPHB0Agc64gBNlFiWP+oIHzIU6q3hb/7pkPgFWrUGtLovcWOmfQ/aPTller/QQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xx5HmQvZabdZHQ0O60sc1Tj0WRthwY4K9haSHtfH7zE=;
 b=P/SuEVHIwrHBFk9n0Q7FFaZMmIcJxhCqxMw5J7coZ9ZXd/nc8axaNWKB3orJPInhCo0zlpHuYQjwQ4/ultn6IHMmeLf4sUqBQQ00Jt2bbKN41G4DSuhvsSnzOcZS5JgZnqYuWFDCqSumc3mqaV0prnDzqOFD3VMuMN6/PCDOvTCZTivp8IyKJVoYz/h707grYnYjRh5IL9tC9ztXW1dNOeacm1PHiP7OZFctDeNXWEJZ+dgRhLeqaTFoN9tUylOj15gh1tU3lASAPRIr03DLZTW4zpEdZHhZ2FCy7Xl7BOzk6ukl48MN5JOrdWiEYINESlnPhsiBuwlT2+igPkYizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=rte.se; dmarc=pass action=none header.from=rte.se; dkim=pass
 header.d=rte.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtesweden.onmicrosoft.com; s=selector1-rtesweden-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xx5HmQvZabdZHQ0O60sc1Tj0WRthwY4K9haSHtfH7zE=;
 b=YV548rEg2Ubg+eF6zAYq0dXNGSoHuuE0LCxmkTYZyO1gcMfXw3WAOaVj7F0cK6QL+8ckNllCNF4ZRGbc57aZINXJqXMT4FV0P6gq9cMbUfBezOHp0MCwVuTCxr6x2Z1vmJc3y0rD8XFt56FTfTdNjhvkddq/Rtl063SnCDeO9illEAeiWedQGcB7gmgW+3frRUOAThJgAYS3EWfcmUf9Xqz57HzuTXE1cl6XlXMttZFVTuM2i7IhEqfP6XnNZTybXt8TAzxR31IvONjgpnCcKC2C3DBuNDIy1O57difveIIRb/oRtwf8hzUUhL/NWBQe518UMh+C2zaGjznq2Na12g==
Received: from VE1P189MB0989.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:14b::14)
 by AS1P189MB1963.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:4a1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.28; Thu, 18 Aug
 2022 08:40:22 +0000
Received: from VE1P189MB0989.EURP189.PROD.OUTLOOK.COM
 ([fe80::89f7:4587:1f0d:5034]) by VE1P189MB0989.EURP189.PROD.OUTLOOK.COM
 ([fe80::89f7:4587:1f0d:5034%9]) with mapi id 15.20.5504.027; Thu, 18 Aug 2022
 08:40:21 +0000
From: Mats Loman <mats.loman@rte.se>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Endpoints are not in sync (latest handshake)
Thread-Topic: Endpoints are not in sync (latest handshake)
Thread-Index: AQHYstzqaN50zUSMf0uspv91Jh9xxA==
Date: Thu, 18 Aug 2022 08:40:21 +0000
Message-ID: <VE1P189MB0989ABC50A06400CFC34F398E56D9@VE1P189MB0989.EURP189.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rte.se;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82741ac5-9faa-4596-fd9f-08da80f549ca
x-ms-traffictypediagnostic: AS1P189MB1963:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xGDeksvlSpW0ePiD2v43iHeh/MVXHZNtYVKPfAaDI+dgnDSdQvaHiDO2KdUVMtvOd1i8rdEAF/3HPYxhhvusckC03rIsHJqqP8JL3ocRtt1Cvw5WMvbziyIU54KooU0PiU9aSJHsJ4nM89+ywv0qVzyOmNBpCQ/+toDeSKTXV9R2FkSeHgsORe1jT5zuz8zklHrkP+84fq0eeVTdtayfZncoqc1IN0ONnMtsQm72Ifi5Dj6dlLUO2a2EK5Zw8PT4VsIiY2wUDVRn5eDCPYC0pWKpmIvgOzaR/figAmXp8utuAFOO84LU5KI7AIa0AfCWrhgmReZS1n/H/NZgdzqD4sTaz0m1sM3SKZyWnDA1enVybXb2rw0qi9kOE48NhoBNVJCrvCfrS7wblo6ohbRLPMuQT7cULd1TDXg3D9GraFfIcZbwkjOHfZf0GkL4wOU94zcsiBwt8WxMJbxPirM1vdI/2YK/FgNo9CqunGhUD70WtxtL82JZvS7Ws5uOYHPOj87uF5HgUzqoFedIMWjTt7594dSgP2e8yzvInDuaW9og9F1GQcyARtG1TYx8ZDSSl7ktBP7tuwWv/HoMK+3ujbkMFf4cgsvtHP7Jn+Zd31L+KFYCxejmUV3MTOriUGHaCZ1XvSiDotPqOnuAGGVxyMn50SUmTGO/0aPkMiDvCfKaAGxooTGgu5f0bn4Wdmjg2/O+AJGjGiBjlbWXht7D8f5XD5AfqSrL6d3kjbwt/fVjUfjm25As4iZBhSCdMah2ffsd/iU08r1XupR8byCn9A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VE1P189MB0989.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(376002)(136003)(39830400003)(346002)(55016003)(8936002)(478600001)(66946007)(52536014)(8676002)(64756008)(76116006)(66556008)(66446008)(6506007)(44832011)(86362001)(26005)(66476007)(83380400001)(186003)(7696005)(9686003)(5660300002)(91956017)(41300700001)(6916009)(33656002)(38100700002)(38070700005)(316002)(122000001)(2906002)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?aQxG7z4PfWzXsWIYTPlDbBxl6T9pGnpBCiqhbHtBNMxyLhNpU+BcQI70pE?=
 =?iso-8859-1?Q?IWEorUIH5BvcgoqnabvxeLtrPVLy0/AJAXcukdVjykVUVtOYS7oiiAvlil?=
 =?iso-8859-1?Q?uQMRTJTwYQ4yP84JQc3qM8g8yVxVemdFVE13AdHztg9OhzXdNV2gIxMrYR?=
 =?iso-8859-1?Q?WMKzt24q2KByZphxL0UO24wubbxyYRNbim7HD5tnLpCZxloH87fm2Nq+Cy?=
 =?iso-8859-1?Q?PLQoHXOEXuglUV+UkUBV75gaSFbtYDQIChXrs6TFhUCwv1v7viaSfdCNk/?=
 =?iso-8859-1?Q?1/x0ftMrLZJIDPwD5EAHN9U0xu+xbN2KVb4I8ur4XoHjknK4HuY0gw/Qsa?=
 =?iso-8859-1?Q?TlFaC07KjJCZMbkDs741C9r02QsHzAg2AG0FNjeGQG5V9XiRpwh0G3/im8?=
 =?iso-8859-1?Q?0eQsk2GYHEn40toTxxSxOuofb2Grn667Q+F5ZGC0gdxxK6GUoWAAXYQeIS?=
 =?iso-8859-1?Q?c6C3pVXsFm1Sne1U5AV0h+H3OWGN3V3xEPbbVCbUumlmjHAWyJIYm19cl/?=
 =?iso-8859-1?Q?fdERV1JA9FogjF8glhCUZVJZKQlpJuSujK4zO1hJllyi7qGVyjmSsRJKBC?=
 =?iso-8859-1?Q?5RJ4P75bxqygOTCph1DbYnbPB3oqB2qYSvUofEzQfuvEXy6BxGcXgqdZIN?=
 =?iso-8859-1?Q?lQHF8pjnbb+s4r5tow7K7ss8CVDvOuIjVPXkRyF7yUzFkOUu0K77XThaD8?=
 =?iso-8859-1?Q?9w5icIThqCb54boW2OqEVR81Vayuv58b/I0Hg9l/Un+TnTGGhXpbES+0/4?=
 =?iso-8859-1?Q?r92zuCI5ffzDgtL1UeP4RarTMsY/XTjHHCh++3/62svXDwWNARVhVNkgWW?=
 =?iso-8859-1?Q?Ak6lhB5FuvhTbHSZiJ9Ze3e/SBId86HZ+wrsC+lfc3zfoK+NjiJmk7Eikn?=
 =?iso-8859-1?Q?Okq0zQznkr9I+oXTWMEqrj86nAYcgNQVi5SeRA/6GfjjSufkvsLtYLMS+2?=
 =?iso-8859-1?Q?kfTh8qAwRz94ct1rudEMQ+FMSvyvj1MERLTc+AwBMYc8zVy9PfvwebLlh0?=
 =?iso-8859-1?Q?cpJUO4xq+lGI1MddxXoddOCo09cL7v3AoOxsa50HYNZ01OQpGhUWz0Pe5q?=
 =?iso-8859-1?Q?WaeluMSklQWpxYWLtE6KUwGOc+P4UmDSFEffqiFKk0oGQlv84SjlpT8WAk?=
 =?iso-8859-1?Q?3g5AtDRUJ7622jVTp827g7F7LAbUT4wz4ceHMdZOfd7yzdj8hyahTmWLdH?=
 =?iso-8859-1?Q?ProGAdml0/V4bplvTOWG+eLXVF+H8LQxoFgPA4OhdPmNJPzlvFuc7r0zM8?=
 =?iso-8859-1?Q?1mHxpRa3yncWvlLV04WUx5E4HYyuJRMaOc0EuydOJMV/bkFuumwqqs6VcM?=
 =?iso-8859-1?Q?U5TmLHGiwynW80m9X1dNuy4tumT1SHwmOnsLNKzeH/mIzt/0XUo5H1V4xx?=
 =?iso-8859-1?Q?0wwQd86fpc09F7TUub1yIfWOjZBvLIPmwbidWNprW/C1z7yvSRElSzh3Ip?=
 =?iso-8859-1?Q?2vK7xtwG5WP4oQjcpo0FZkBbOfLOymu8cyRki8VvUnPeGA9FFpPSrOqC2t?=
 =?iso-8859-1?Q?U1yDKE6WcqWAzLvqX1bXL/RbixVQJ7kV860inTi4GGPgYUhQaif+UduucL?=
 =?iso-8859-1?Q?RsE7iPZsDu/4+w5rq73AUVIpWr138x1Ax8tnkF+H8C5HN3WWCrJgHKYF1f?=
 =?iso-8859-1?Q?yaqdsK6CPaqXk=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: rte.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1P189MB0989.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 82741ac5-9faa-4596-fd9f-08da80f549ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2022 08:40:21.9260 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: cd53aeee-83dc-41cc-adaf-1e216ce7f7ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OM546DmtLC1TWFBhPLdIz9JzbqXneTLPZ5UQE/wLQqD+VBBTqTAk62V6QV80SUgNaZmx9p23kLSlsV0AZbPxjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P189MB1963
X-Mailman-Approved-At: Tue, 23 Aug 2022 13:35:50 +0000
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

I have two wireguard endpoints that has different opinions about when the l=
ast handshake was made:=0A=
=0A=
interface: wg0=0A=
  public key: PauftxCvmti7CDDZ9yj6EKZ+r9zQj6gjb9hvP1whzwQ=3D=0A=
  private key: (hidden)=0A=
  listening port: 17395=0A=
=0A=
peer: s5dnr91F06+AQ/3o5urOM5Dc1f0gzHOsGjwD+AEmwDA=3D=0A=
  endpoint: 192.168.201.24:17395=0A=
  allowed ips: 192.168.26.197/32, 192.168.201.38/32=0A=
  latest handshake: 8 hours, 42 minutes, 30 seconds ago=0A=
  transfer: 260.73 GiB received, 313.35 GiB sent=0A=
=0A=
And:=0A=
=0A=
interface: wg0=0A=
  public key: s5dnr91F06+AQ/3o5urOM5Dc1f0gzHOsGjwD+AEmwDA=3D=0A=
  private key: (hidden)=0A=
  listening port: 17395=0A=
=0A=
peer: PauftxCvmti7CDDZ9yj6EKZ+r9zQj6gjb9hvP1whzwQ=3D=0A=
  endpoint: 192.168.201.23:17395=0A=
  allowed ips: 192.168.26.200/32, 192.168.201.249/32=0A=
  latest handshake: 2 minutes, 15 seconds ago=0A=
  transfer: 282.13 GiB received, 276.13 GiB sent=0A=
=0A=
It is not possible  to send data through the tunnel  in both directions onl=
y in one direction.=0A=
=0A=
It is pretty easy to repeat this situation:=0A=
Send UDP packets through the tunnel at a speed that wireguard cannot keep u=
p with. I expect packet loss in this case but not that the tunnel is "parti=
ally closed".=0A=
=0A=
Any ideas?=0A=
=0A=
Best regards,=0A=
Mats Loman=
