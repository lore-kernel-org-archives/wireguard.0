Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17402C4363D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 01:04:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A6F120BED
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 01:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bu+A6HzV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A6F120BED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d73cc9f0;
	Thu, 1 Oct 2020 00:32:23 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c9a05c0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 1 Oct 2020 00:32:20 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id x23so1235179wmi.3
 for <wireguard@lists.zx2c4.com>; Wed, 30 Sep 2020 18:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:disposition-notification-to
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6Zsxgg2PjR5NDihOSTUm958lXNiA4HyfhnMqhm+qJcc=;
 b=bu+A6HzVyY8ZufX+YDe4I3Fgp3fKiYMzPMDPwH6fMwhydfklvD/h25dnX06+5eYIFx
 2tFufsWKN2U1eCXz+Yyh3Lrg3KbcYxZ3DOWwQmGFP++FRnP0l7aNvGqyY/VX8kLvtjoX
 309UHly4ptgvwZBvdV2w6xOhHGsh+Dp1NugvV0meIwCR7hbUAfF2+5KDkEFnz3pZlV9+
 2kCMAUOSKWkmmvZr7BMXlragRHQJ40+wAl6OeY36Y3HNLIaUJJnpGIMceOlyxWACf67q
 i2vyr9YkkQOWPKOHHCJ7AH71sj721tfEOUpDG0+vksngTsIBWnUVQjQnrt5uSOQUF3gl
 wqMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id
 :disposition-notification-to:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=6Zsxgg2PjR5NDihOSTUm958lXNiA4HyfhnMqhm+qJcc=;
 b=IOia14qf2Ap1RenHlV/NFMu8zdqIyTgkenMtnq/T8pPqWa/yx8rbpyVUvHKHJV/szn
 KQ7C4RplV1CMwNBQ/9YyP6WXW6ExNn7OLip++/HoJaMSS7mGKRb5DIAHOkPP2anINcad
 BySFX3yGhSzrpssLSJ+J8pcJAFHnD79qrCnvPNPITaAC3xEXfdQavL9Y762w+gRMA1YS
 LIWEk6DmuWkGBXPOozJuDRUZrRYK0fhCToIctzDfV6NKzRxCaMQg8PFo/gWq7FJtsbbr
 nfQgEWeCK2aDHgMK50bcm/tEfXfgZ+W1co13xzu92N0zsKl+Nx1sfNQU3CLWxfm3rbxq
 LItw==
X-Gm-Message-State: AOAM53175Rgj9j17g0J+c7au4uw/37cRSuRIUKq5OSxlw1HW8Oxs8tT/
 KXOLzBjRUszc+/vVgJZZOE8NRsu+N3F+GOPG
X-Google-Smtp-Source: ABdhPJyQu4EUoGXJkt3ixDPM6BrlQ2t6cJFQUSVHnJNKST+N4PVtVpeZlIO48OjwXMD42OAyShJWYw==
X-Received: by 2002:a1c:e484:: with SMTP id b126mr5476545wmh.44.1601514244820; 
 Wed, 30 Sep 2020 18:04:04 -0700 (PDT)
Received: from ?IPv6:2a02:8010:66b7:dddd:6cc9:aaf9:13ee:598?
 ([2a02:8010:66b7:dddd:6cc9:aaf9:13ee:598])
 by smtp.gmail.com with ESMTPSA id o4sm6012819wru.55.2020.09.30.18.04.03
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 18:04:04 -0700 (PDT)
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
To: wireguard@lists.zx2c4.com
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
 <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
 <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
From: Brian Gregory <bdgregory@gmail.com>
Message-ID: <ac34f158-0c0c-7303-1851-9d889af95828@gmail.com>
Date: Thu, 1 Oct 2020 02:04:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
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

I find on Android that the best Wireguard client is definitely not the=20
one created by the Wireguard team.

Perhaps there are other iOS Wireguard clients you could try?

On Android I use VPN Client Pro by colucci-web.it

Brian Gregory.
bdgregory@gmail.com
www.Brian-Gregory.me.uk
(Home)

On 28/09/2020 13:59, Laura Smith wrote:
> I am starting to seriously consider switching back to OpenVPN.
>
> Wireguard is great and all that, but frankly if there's not going to be=
 any effort by the developers to fix these Mac and iOS problems then I'm =
not going to stick around any longer.
>
> I never had the sort of problems I described with OpenVPN, things such =
as having to check whether or not my VPN is still established should not =
be something I am forced to do.
>
> I don't speak C or Swift so I can't offer to look at the code.
>
> Laura
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Origina=
l Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=

> On Friday, 18 September 2020 17:02, Eddie Jones <data.goldfish@oneacl.c=
om> wrote:
>
>> Hi,
>>
>> Sorry if this message comes out of thread, I wasn't subscribed when th=
e messages below were sent (I did click on the web link containing "in-re=
ply-to").
>>
>> I'm also seeing the same on iOS (an iPhone and an iPad) after I put th=
em to flight mode (overnight or for more than a few hours).
>> It seems to recover after a minute and a half but looking at the logs =
I also saw that handshakes are being attempted while in flight mode every=
 ~ 10 minutes.
>> This doesn't seem to affect battery life (significantly)
>>
>> sample log:
>>
>> ----------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---------
>>
>> 2020-09-11 00:35:06.972422: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 5 seconds, retrying (try 3)
>> 2020-09-11 00:35:06.972897: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 00:35:06.975534: [NET] peer(CHzf=E2=80=A61U30) - Handshake =
did not complete after 5 seconds, retrying (try 6)
>> 2020-09-11 00:35:06.978000: [NET] peer(CHzf=E2=80=A61U30) - Sending ha=
ndshake initiation
>> 2020-09-11 00:35:06.980886: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455=
: sendto: no route to host
>> 2020-09-11 00:35:06.981306: [NET] peer(YhQB=E2=80=A6Lcm8) - Removing a=
ll keys, since we haven't received a new one in 540 seconds
>> 2020-09-11 00:35:06.985392: [NET] peer(CHzf=E2=80=A61U30) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455=
: sendto: no route to host
>> 2020-09-11 00:35:06.985751: [NET] peer(CHzf=E2=80=A61U30) - Removing a=
ll keys, since we haven't received a new one in 540 seconds
>> 2020-09-11 00:35:06.987170: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting k=
eypair
>> 2020-09-11 00:35:06.994062: [NET] peer(CHzf=E2=80=A61U30) - Awaiting k=
eypair
>> 2020-09-11 00:35:12.160213: [NET] peer(CHzf=E2=80=A61U30) - Handshake =
did not complete after 5 seconds, retrying (try 2)
>> 2020-09-11 00:35:12.160762: [NET] peer(CHzf=E2=80=A61U30) - Sending ha=
ndshake initiation
>> 2020-09-11 00:35:12.168432: [NET] peer(CHzf=E2=80=A61U30) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455=
: sendto: no route to host
>> 2020-09-11 00:35:12.232323: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 5 seconds, retrying (try 2)
>> 2020-09-11 00:35:12.232701: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> [a few more]
>> 2020-09-11 00:55:13.793554: [NET] peer(CHzf=E2=80=A61U30) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455=
: sendto: no route to host
>> 2020-09-11 00:55:13.823302: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 5 seconds, retrying (try 19)
>> 2020-09-11 00:55:13.823679: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 00:55:13.830352: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455=
: sendto: no route to host
>> 2020-09-11 00:55:18.961279: [NET] peer(CHzf=E2=80=A61U30) - Handshake =
did not complete after 5 seconds, retrying (try 20)
>> 2020-09-11 00:55:18.961761: [NET] peer(CHzf=E2=80=A61U30) - Sending ha=
ndshake initiation
>> 2020-09-11 00:55:18.969481: [NET] peer(CHzf=E2=80=A61U30) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455=
: sendto: no route to host
>> 2020-09-11 00:55:19.013912: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 5 seconds, retrying (try 20)
>> 2020-09-11 00:55:19.014284: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 00:55:19.021406: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455=
: sendto: no route to host
>> 2020-09-11 00:55:24.071094: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 20 attempts, giving up
>> 2020-09-11 00:55:24.072152: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 00:55:24.079339: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455=
: sendto: no route to host
>> 2020-09-11 00:55:24.079992: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting k=
eypair
>> 2020-09-11 00:55:24.083542: [NET] peer(CHzf=E2=80=A61U30) - Sending ha=
ndshake initiation
>> 2020-09-11 00:55:24.088956: [NET] peer(CHzf=E2=80=A61U30) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455=
: sendto: no route to host
>> 2020-09-11 00:55:29.187685: [NET] peer(CHzf=E2=80=A61U30) - Handshake =
did not complete after 5 seconds, retrying (try 2)
>> 2020-09-11 00:55:29.188175: [NET] peer(CHzf=E2=80=A61U30) - Sending ha=
ndshake initiation
>> 2020-09-11 00:55:29.195769: [NET] peer(CHzf=E2=80=A61U30) - Failed to =
send handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455=
: sendto: no route to host
>>
>> Log for when I woke up in the morning:
>> 2020-09-11 07:30:33.963812: [NET] Network change detected with unsatis=
fied route and interface order [utun2, en0]
>> 2020-09-11 07:30:33.964685: [NET] DNS64: mapped redacted_peer_1 to its=
elf.
>> 2020-09-11 07:30:33.970653: [NET] DNS64: mapped redacted_peer_2 to its=
elf.
>> 2020-09-11 07:30:33.971174: [NET] DNS64: mapped wg_endpoint to itself.=

>> 2020-09-11 07:30:33.972489: [NET] DNS64: mapped wg_endpoint to itself.=

>> 2020-09-11 07:30:33.974145: [NET] UAPI: Transition to peer configurati=
on
>> 2020-09-11 07:30:33.976164: [NET] peer(YhQB=E2=80=A6Lcm8) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:33.978041: [NET] peer(CHzf=E2=80=A61U30) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:33.978884: [NET] peer(gk0t=E2=80=A6AyAc) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:33.981027: [NET] peer(xmkD=E2=80=A6IMho) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:33.983182: [NET] Routine: receive incoming IPv4 - sto=
pped
>> 2020-09-11 07:30:33.985043: [NET] Routine: receive incoming IPv6 - sto=
pped
>> 2020-09-11 07:30:33.987112: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 07:30:33.989163: [NET] Routine: receive incoming IPv6 - sta=
rted
>> 2020-09-11 07:30:33.991036: [NET] Routine: receive incoming IPv4 - sta=
rted
>> 2020-09-11 07:30:33.993164: [NET] UDP bind has been updated
>> 2020-09-11 07:30:34.522914: [NET] Network change detected with satisfi=
ed route and interface order [en0, utun2]
>> 2020-09-11 07:30:34.543799: [NET] DNS64: mapped redacted_peer_1 to its=
elf.
>> 2020-09-11 07:30:34.546818: [NET] DNS64: mapped redacted_peer_2 to its=
elf.
>> 2020-09-11 07:30:34.547362: [NET] DNS64: mapped wg_endpoint to itself.=

>> 2020-09-11 07:30:34.548670: [NET] DNS64: mapped wg_endpoint to itself.=

>> 2020-09-11 07:30:34.550471: [NET] UAPI: Transition to peer configurati=
on
>> 2020-09-11 07:30:34.552311: [NET] peer(YhQB=E2=80=A6Lcm8) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:34.555128: [NET] peer(CHzf=E2=80=A61U30) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:34.555231: [NET] peer(gk0t=E2=80=A6AyAc) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:34.557314: [NET] peer(xmkD=E2=80=A6IMho) - UAPI: Upda=
ting endpoint
>> 2020-09-11 07:30:34.559804: [NET] Routine: receive incoming IPv6 - sto=
pped
>> 2020-09-11 07:30:34.561226: [NET] Routine: receive incoming IPv4 - sto=
pped
>> 2020-09-11 07:30:34.563905: [NET] Routine: receive incoming IPv6 - sta=
rted
>> 2020-09-11 07:30:34.565256: [NET] Routine: receive incoming IPv4 - sta=
rted
>> 2020-09-11 07:30:34.567279: [NET] UDP bind has been updated
>> 2020-09-11 07:30:37.309301: [APP] App version: 0.0.20200127 (17); Go b=
ackend version: 0.0.20200121
>> 2020-09-11 07:30:39.013248: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 5 seconds, retrying (try 2)
>> 2020-09-11 07:30:39.013410: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 07:32:00.302471: [NET] peer(YhQB=E2=80=A6Lcm8) - Removing a=
ll keys, since we haven't received a new one in 540 seconds
>> 2020-09-11 07:32:00.303803: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake =
did not complete after 5 seconds, retrying (try 3)
>> 2020-09-11 07:32:00.304892: [NET] Received invalid response message fr=
om redacted_peer_1:44455
>> 2020-09-11 07:32:00.305435: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending ha=
ndshake initiation
>> 2020-09-11 07:32:00.308002: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting k=
eypair
>> 2020-09-11 07:32:00.309891: [NET] peer(CHzf=E2=80=A61U30) - Handshake =
did not complete after 5 seconds, retrying (try 14)
>> 2020-09-11 07:32:00.311963: [NET] peer(CHzf=E2=80=A61U30) - Sending ha=
ndshake initiation
>> 2020-09-11 07:32:00.372409: [NET] peer(YhQB=E2=80=A6Lcm8) - Received h=
andshake response
>> 2020-09-11 07:32:00.372697: [NET] peer(YhQB=E2=80=A6Lcm8) - Obtained a=
waited keypair
>> 2020-09-11 07:32:00.529186: [NET] peer(CHzf=E2=80=A61U30) - Received h=
andshake response
>>
>> I normally try to toggle wireguard connection but it seems to hang so =
I try to turn off/on wifi but
>> it appears that after about 1:30 min it fixes itself - this time I jus=
t let it alone (I was actually looking at the logs)
>>
>> Would there anything I can do on my end or is a code update in the App=
 required?
>>
>> Thank you.
>>
>> In reply to:
>>
>> ----------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
-------------------------------------------------------------------------=
---
>>
>> Alexander Burke alex atalexburke.ca
>> Thu Aug 27 10:29:10 CEST 2020
>>
>> I can=E2=80=99t speak for the Mac side, but I=E2=80=99ve been seeing t=
he same on iOS for months now.
>>
>>> /El 23 ag 2020, a les 20:34, Laura Smith <n5d9xq3ti233xiyif2vp at
>> protonmail.ch https://lists.zx2c4.com/mailman/listinfo/wireguard> va
>> escriure: />//>/Hi, />//>/These aren't show-stoppers per-se, but it wo=
uld be nice to see them
>> fixed and new clients pushed out via the App Store: />//>/(1) MacOS (1=
0.15.6 but also observed on 10.15.5, not tested on anything
>> older) />//>/- Start with WG client in an operational state />/- Disco=
nnect network (e.g. if on WiFI, turn off the WiFi in the menu bar) />/- S=
leep the machine />/- Wait- Wake the machine />/- Turn on Wifi />/- Note =
that WG client fails to re-establish connectivity (shows
>> connected, but no traffic flows until you deactivate/reactivate WG) /
>

