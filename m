Return-Path: <SRS0=mwgs=BA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882A7C433E5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:04:06 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FB842064B
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 Jul 2020 14:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cagir.me header.i=@cagir.me header.b="qdnequQV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2FB842064B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=cagir.me
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 043e379d;
	Tue, 21 Jul 2020 13:41:33 +0000 (UTC)
Received: from dal2relay5.mxroute.com (dal2relay5.mxroute.com [64.40.26.5])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 68e6c5d9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 Jul 2020 13:41:30 +0000 (UTC)
Received: from filter003.mxroute.com ([168.235.111.26]
 168-235-111-26.cloud.ramnode.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by dal2relay5.mxroute.com (ZoneMTA) with ESMTPSA id 17371b0365100055e6.002
 for <wireguard@lists.zx2c4.com>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Tue, 21 Jul 2020 14:04:00 +0000
X-Zone-Loop: 1f69932c1e6880e851d42b4a35f12f4379bcf6af351e
X-Originating-IP: [168.235.111.26]
Received: from echo.mxrouting.net (echo.mxrouting.net [116.202.222.109])
 by filter003.mxroute.com (Postfix) with ESMTPS id 82C7260033;
 Tue, 21 Jul 2020 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cagir.me;
 s=x; h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:Mime-Version:
 From:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JLKCUTibRyehjjE31aS6CIMLZ0WCLIH5XqvIuav3hT8=; b=qdnequQVED2ldohtahZUH3oEfR
 jTXmD/Y4FYy2OOy+gfa11GtgOX9jtRyh54pvH+HzeHk5MMa1Fco9Kum45hAE+A/8814zlCOCh0B4Y
 7MjBSvJ8bOavUp4RW1Z2iJ8Cley+NZHD2qPKYs5LNorXkPhxj9jOzCMwHj9yE87eCWjea3rnztHo3
 RM6LiBFybRSxyTI8lyz3yhtz+FsRyUX3HG/fx4d87FIG8tQifvqD7JYdIlD0wETbLq6QR6LEKlQzT
 oMrRCDgQWk6V264n0DHYw4Tn4fYpG7ADLz3r3fmXa0NoGt/5Pv7jaSx/YR+lblPPE3IMKfhajIIeZ
 EV3sO6GQ==;
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: =?utf-8?Q?Hasan_Berkay_=C3=87a=C4=9F=C4=B1r?= <berkay@cagir.me>
Mime-Version: 1.0 (1.0)
Subject: Re: MacOS IPv6 not functioning without custom static route
Date: Tue, 21 Jul 2020 16:03:57 +0200
Message-Id: <AFF46572-54B1-48D3-9465-0A4E404679D2@cagir.me>
References: <CAN00TTrDhy89dvyiOMPbvQe65uZ=hqzxHCH7nHdR=S0HkyeCFA@mail.gmail.com>
Cc: wireguard@lists.zx2c4.com
In-Reply-To: <CAN00TTrDhy89dvyiOMPbvQe65uZ=hqzxHCH7nHdR=S0HkyeCFA@mail.gmail.com>
To: Adam Cooper <adam@acpr.dev>
X-Mailer: iPhone Mail (17F80)
X-AuthUser: berkay@cagir.me
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

Glad to hear that, you=E2=80=99re welcome.

There is definitely something weird happening with having ::/0 in AllowedIPs=
 on MacOS. In my situation too that the client were generating a default IPv=
4 route and I had to tunnel my IPv4 too until I discovered the =E2=80=9C::/1=
, 8000::/1=E2=80=9C trick.

Best,
Berkay

> On 21. Jul 2020, at 15:58, Adam Cooper <adam@acpr.dev> wrote:
>=20
> =EF=BB=BFWow. So I'd made the assumption that this is just what I needed t=
o do
> to access lan resources.
>=20
> Turns out "0.0.0.0/0, ::/1, 8000::/1" will allow that just fine on
> OSX. I still get a broken system if I specify ::/0 as the default
> route doesn't appear to get created but with using ::/1 8000::/1 it
> seems to work around that.
>=20
> Problem solved! Thank you.
>=20
> Though it's not at all intuitive or expected. Is there some issue
> queue or something this can be added to for the OSX client
> application?
>=20
> Thanks
> Adam
>=20
>> On Tue, 21 Jul 2020 at 14:49, Hasan Berkay =C3=87a=C4=9F=C4=B1r <berkay@c=
agir.me> wrote:
>>=20
>> Are you sure that private IPs get routed through WG while AllowedIPs is
>> "0.0.0.0/0, ::/1, 8000::/1"? I have just tried to ping my local router
>> whilst connected to a tunnel with "0.0.0.0/0, ::/1, 8000::/1" and didn't
>> have a problem.
>>=20
>> I mean, the way which makes sense is that AllowedIPs should work with
>> your configuration and we wouldn't even have this conversation, however
>> there are some things awkwardly different on the MacOS version from the
>> GNU/Linux versions of WG client(s), so I think it might help to try
>> every variation.
>>=20
>> Best,
>> Berkay
>>=20
>>> On 21.07.20 15:29, Adam Cooper wrote:
>>> Mmm. It looks like unticking "Exclude Private IPs" and entering
>>> "0.0.0.0/0, ::/1, 8000::/1" gives me a functional setup. Trouble is I
>>> don't want to route the private IPs and ticking the box (whilst
>>> retaining '::/1, 8000::/1') allows no traffic at all. There's
>>> something odd about the way the client is configuring routes but I've
>>> not got the expertise to figure it out :(
>>>=20
>>> On Tue, 21 Jul 2020 at 14:12, Hasan Berkay =C3=87a=C4=9F=C4=B1r <berkay@=
cagir.me> wrote:
>>>>=20
>>>> On 15/07/2020 14:14, Adam Cooper wrote:
>>>>> ...
>>>>> Probably worth mentioning that I tried to replace ::/0 with ::/1,
>>>>> 8000::/1 but that just results in completely broken connectivity in
>>>>> IPv6 and IPv4 - which may be another issue in and of itself.
>>>>=20
>>>> Did you try only having "::/1, 8000::/1" in the AllowedIPs option? I ha=
d
>>>> a default route creation issue myself where I'm only trying to tunnel
>>>> IPv6 through; and having this actually solved it.
>>>>=20
>>>> $ netstat -nr
>>>> Routing tables
>>>> Internet:
>>>> ...
>>>> Internet6:
>>>> Destination                             Gateway
>>>> Flags         Netif Expire
>>>> ::/1                                    link#14
>>>> UCS           utun2
>>>> default                                 fe80::%utun0
>>>> UGcI          utun0
>>>> default                                 fe80::%utun1
>>>> UGcI          utun1
>>>> default                                 fe80::%utun3
>>>> UGcI          utun3
>>>> default                                 [ public IPv6 ]
>>>> UGcI          utun2
>>>>=20
>>>> If just "::/1, 8000::/1" solves the IPv6 issue, I guess you can give it=

>>>> a try with "0.0.0.0/0, ::/1, 8000::/1" to see if both routes are create=
d
>>>> properly?
>>>>=20
>>>> Best,
>>>> Berkay

