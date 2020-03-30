Return-Path: <SRS0=yWyP=5Q=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A59C2D0EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:30:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F87B20732
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 31 Mar 2020 03:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="rqqnj+P1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F87B20732
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5520ec22;
	Tue, 31 Mar 2020 03:22:36 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d052148a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 08:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1585557657;
 bh=I6YkVaPuR2LfmXrz5DSxX5ZZCYa1BwM+ODhAt1oLock=;
 h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
 b=rqqnj+P1lBK71Rh5irpOxrBaMhQjkiw1wN5EC25hsVdio9W6HVNNwmqvPWQI8nX+i
 fPnqUxXdPnGC96VRZBp4p/hCZdCsDUmdSdgdX6KnNlB06lrRMMK65/EjAcxhShiZ3j
 +6/vtRBbKMrM301QVduktpOyjxLRbpstrfrXDNMg=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.7.20] ([80.88.30.34]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Lvjiy-1jHd6j2HW8-017Ynk for
 <wireguard@lists.zx2c4.com>; Mon, 30 Mar 2020 10:40:57 +0200
Subject: Re: [PATCH wireguard-windows] Calculate the actual route metric by
 summing interface and route metric.
To: wireguard@lists.zx2c4.com
References: <20200327170750.5285-1-suyjuris.gi@nicze.de>
 <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
From: Ludwig Herzog <ludwig.herzog@web.de>
Message-ID: <e7f67006-09a0-e775-5f7d-4d0c8e7e271a@web.de>
Date: Mon, 30 Mar 2020 10:40:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9r4vDKeWCjp2XF3pKaKUDokDphnVoYBqV5YfLd=gTNbPA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ESObifOxb9jxtO7Zs5A74kEa4vslQ9tTO37TJt2vBV05h/F/Koi
 FsAXjIpn9e40NHgan7vIiWs01WZ1KlK2TAgJCQjDDGeSLievW+VoAhhlxwlNuQqUy30emAC
 Zv0Equ+pWmF+yQDsUBaH8BHInJFULD+4r1KZATvEdMkjrYxUxOoW+z12Uu/p5yTmXP9GbYP
 VJPBENRl+2R3JZnZvPHpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hBES4Qxmqg4=:U7Jyr+5Crt93mike+MFlEz
 seoqW5tj4x4NAKWSJcPrUccrBbt7xw5r4lFQp8IB7MArTzY+DCywUp9geCnTLYb0eQrFENcK/
 lzvaSRFVGLC6WbYVxAiOCkPhyyAFjnbZXN0SjmSK80g0sEl0R789eJv5HagcSywpYhwyTgK9B
 vlvOy1jSmMsuu4XD/gYk6ROhRWpO2p2rtrlNy6bn89qas82cU9hHAHMCA/HgKtzGCiPeYI851
 6PMB4hqyCUN5uapouUih5IrRtq9DfLTLSBR533u8LC0MWf7sLz4O45aed40f3VRbRahMV9K0n
 4fRdFasRnGO2C6j9mv0HlcuxSja+509fu6MnV6o1gCc0GOk+EWOSc9AOnOuoY5PxWVEbW3Eyd
 Dhpi+sxBZHmiTsVokRXarTX3ykXhSioweHjO80z2pepXc8hp6k5G7gTvj/MYC1CsHH2ybq/8M
 E1RMT5b2QNFSXFwuhY8w0qya3AdbxGJtA5l2MeCpQtsiMt+8Yxux9LK89XXTI4kRZnDLvbxu9
 sHvZSSdyvxmaBDKiHblDiryg9sMVRYQ5F8secERoe3W1yFIvR4dPvheNh/wgdWeyo9X/adwpC
 myheQlMPsGgpFBdHZ6sY0C2Gv4G7Pod/2FqqVBYnP6ZlwA2wOL0inJBcZEeflEnTNqv6rWkp+
 jU1gRUihwaug67/IWFiFjOYDMgXrQm+pf+QyvOdezd0/FeYHhHK4Of9X/h2wEJE4W2ucRyTlE
 w80zqpd6idDVFdG0qmL5EFY2V6UXgdNZRloI+2vIMER4qAqWBad6Kbf+Vz7DwO7M65tbrFvUD
 cWjPckqO/QcQfMhoLXBTQmmIENHvpvZlcQ5ZjOD1anpRv9uIiESEvcRmFi9RLMlGuSai9DcDX
 Hk4POyV0gqzswvvx7KzWa9WpsK29uoLDPPPJCAbf0xsUWBvxrBKscvd6P0DLa7FabAx9MLg1U
 4uvIvE2Xjkc4dwBp3gkimC+Z6Ny3nOiUU/qMe5lRdKKyFcTznc7nNZKq7vWzjN0Hl3fqk9tCg
 ZzxfobgieDiLY173lfjEVWvFJqAE8Adl8vGVbiHPbkKZzBz2H5vz2scZUssnPl0//6ZkoDIvD
 s4ydXBY1SfDkykRwGr+G3e1Qg9BYE5yPug07DZPiw7t14PVQqCyChRRDEhvXldkY/TAMITSk6
 GE4+1ugL94w1dNBKxbnv6tEqZSNAcIxQZK0MCIBTruuXWui8EDRYnQ0JPpcQhMaZgM6vptODe
 HCgUnvI/Kodm8hYRP
X-Mailman-Approved-At: Tue, 31 Mar 2020 05:22:32 +0200
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

Hi,

I'm reading this maillist since a longer time and was never brave enough
to mention my problem since I'm not a developer or programmer and don't
know if I can describe it properly. Now this windows/metric stuff came
up, so I take a heart ;-)

In short: I have windows 10 client softwares which only work properly
with manually set adapter and gateway metrics in the VPN network
adapter, what works for openVPN (even better for a logmein test setup)
but not for wireguard, since manual metric settings are not recognized /
overwritten by the windows wireguard app. Is it possible to set the
metrics somehow in the config file? Or prevent the windows wireguard app
from overwriting?

Regards

Ludwig


Am 30.03.2020 um 07:31 schrieb Jason A. Donenfeld:
> On Sun, Mar 29, 2020 at 8:29 PM Philipp Czerner <suyjuris.gi@nicze.de> w=
rote:
>> Signed-off-by: Philipp Czerner <suyjuris.gi@nicze.de>
>> ---
>> Hi,
>>
>> I had some issues setting up Wireguard behind another VPN. Curiously, i=
t bound the physical interface instead of the other VPN, which was the def=
ault route. According to MSDN "the actual route metric used to compute the=
 route preference is the summation of interface metric specified in the Me=
tric member of the MIB_IPINTERFACE_ROW structure and the route metric offs=
et specified in this member" (documentation for MIB_IPFORWARD_ROW2), but t=
he code did not seem to consider this. After I changed the calculation, I =
got the expected behaviour.
>>
>> Cheers,
>> Philipp
>>
>>   tunnel/defaultroutemonitor.go | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/tunnel/defaultroutemonitor.go b/tunnel/defaultroutemonitor=
.go
>> index c102b64..4b24e8e 100644
>> --- a/tunnel/defaultroutemonitor.go
>> +++ b/tunnel/defaultroutemonitor.go
>> @@ -33,8 +33,14 @@ func bindSocketRoute(family winipcfg.AddressFamily, =
device *device.Device, ourLU
>>                  if err !=3D nil || ifrow.OperStatus !=3D winipcfg.IfOp=
erStatusUp {
>>                          continue
>>                  }
>> -               if r[i].Metric < lowestMetric {
>> -                       lowestMetric =3D r[i].Metric
>> +
>> +               iface, err :=3D r[i].InterfaceLUID.IPInterface(family)
>> +               if err !=3D nil {
>> +                       continue
>> +               }
>> +
>> +               if r[i].Metric + iface.Metric < lowestMetric {
>> +                       lowestMetric =3D r[i].Metric + iface.Metric;
> Nice semicolon ;-).
>
> Thanks a lot for this patch and triaging the issue. Nice to hear that
> nested VPNs work. If you don't mind sharing, I'd be interested to
> learn what software sets up its routes in this manner.
>
> Anyway, applied here:
> https://git.zx2c4.com/wireguard-windows/commit/?id=3D66ad537f4e2144112cb=
6686c4fc4856d70bf6a3d
>
> Jason
