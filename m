Return-Path: <SRS0=Zpbp=DI=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D262BC4727C
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:11:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063842087D
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  1 Oct 2020 11:11:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=squyres.com header.i=@squyres.com header.b="iTqtVOm7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063842087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=squyres.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 17a356f0;
	Thu, 1 Oct 2020 10:39:18 +0000 (UTC)
Received: from squyres.com (squyres.com [64.253.106.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d6dc3200
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 30 Sep 2020 00:53:55 +0000 (UTC)
X-Debug-Header: memoryhole.net squyres.com
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=squyres.com; h=
 mime-version:references:in-reply-to:from:date:message-id:subject
 :to:content-type:content-transfer-encoding; s=default; bh=jtk+1f
 +ATzbkb7JY5UxGmx+MW3g=; b=iTqtVOm7tBk+90LKA7x8y27Yf6wFnTMX6dNgv7
 9r+U35Y5Ccuf/U7kBbVVxoWx7CLP2YuDIA07S8LC2hZlgFMWCcYpvHu4Qsk5PoUa
 cBJ5P6gNl7wZJdM4FIA2a4OhJ+sZ7xepZFWT9gqTX9SleMELxSEJwuCbQ2H9xywB
 ObfF0=
Received: (qmail 24699 invoked by uid 64020); 30 Sep 2020 01:25:33 -0000
Received: from unknown (HELO mail-wm1-f49.google.com) (jeff@209.85.128.49) by 
 squyres.com with ESMTPSA (AES128-SHA encrypted, authenticated); 30 
 Sep 2020 01:25:33 -0000
Received: by mail-wm1-f49.google.com with SMTP id t17so184059wmi.4
 for <wireguard@lists.zx2c4.com>; Tue, 29 Sep 2020 18:25:33 -0700 (PDT)
X-Gm-Message-State: AOAM533sfQfMH9r36fiCQs7YovwiZLu6i8QNkw0g116lh4U9Hcad8+aG
 Llr0220+d4V1Fi1xOd0iAFZH9Yh2HqeKg++P+V0=
X-Google-Smtp-Source: ABdhPJyJI7/kGvmuC8GxN4e/iznRbslpaGMD7eKjL4ogN4Gsr8RfcTX0PJh1xfM5ioEUNMGE0BLOEwp8nsBcVXBdVGk=
X-Received: by 2002:a1c:6287:: with SMTP id w129mr180373wmb.52.1601429132428; 
 Tue, 29 Sep 2020 18:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
 <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
 <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
In-Reply-To: <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
From: Jeff Squyres <jeff@squyres.com>
Date: Tue, 29 Sep 2020 21:25:20 -0400
X-Gmail-Original-Message-ID: <CAOmeisUoGznGcF1_Qpj0dmjUS+c1uso2kDkhjbSzy6_RC9r+3w@mail.gmail.com>
Message-ID: <CAOmeisUoGznGcF1_Qpj0dmjUS+c1uso2kDkhjbSzy6_RC9r+3w@mail.gmail.com>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 01 Oct 2020 12:39:16 +0200
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

FWIW, I first publicly reported this same problem with iOS in Jan
2020: https://lists.zx2c4.com/pipermail/wireguard/2020-January/004860.html
(with much more followup information in
https://lists.zx2c4.com/pipermail/wireguard/2020-January/004874.html).

It still happens periodically on my iOS 13 (and now iOS 14) iPhone 8+.
It happens with much lower frequency than it used to, but it still
definitely happens sometimes.


On Mon, Sep 28, 2020 at 8:59 AM Laura Smith
<n5d9xq3ti233xiyif2vp@protonmail.ch> wrote:
>
> I am starting to seriously consider switching back to OpenVPN.
>
> Wireguard is great and all that, but frankly if there's not going to be a=
ny effort by the developers to fix these Mac and iOS problems then I'm not =
going to stick around any longer.
>
> I never had the sort of problems I described with OpenVPN, things such as=
 having to check whether or not my VPN is still established should not be s=
omething I am forced to do.
>
> I don't speak C or Swift so I can't offer to look at the code.
>
> Laura
>
> =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original =
Message =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
> On Friday, 18 September 2020 17:02, Eddie Jones <data.goldfish@oneacl.com=
> wrote:
>
> > Hi,
> >
> > Sorry if this message comes out of thread, I wasn't subscribed when the=
 messages below were sent (I did click on the web link containing "in-reply=
-to").
> >
> > I'm also seeing the same on iOS (an iPhone and an iPad) after I put the=
m to flight mode (overnight or for more than a few hours).
> > It seems to recover after a minute and a half but looking at the logs I=
 also saw that handshakes are being attempted while in flight mode every ~ =
10 minutes.
> > This doesn't seem to affect battery life (significantly)
> >
> > sample log:
> >
> > -----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
-----------------------------------------------------------------------
> >
> > 2020-09-11 00:35:06.972422: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 5 seconds, retrying (try 3)
> > 2020-09-11 00:35:06.972897: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 00:35:06.975534: [NET] peer(CHzf=E2=80=A61U30) - Handshake d=
id not complete after 5 seconds, retrying (try 6)
> > 2020-09-11 00:35:06.978000: [NET] peer(CHzf=E2=80=A61U30) - Sending han=
dshake initiation
> > 2020-09-11 00:35:06.980886: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: s=
endto: no route to host
> > 2020-09-11 00:35:06.981306: [NET] peer(YhQB=E2=80=A6Lcm8) - Removing al=
l keys, since we haven't received a new one in 540 seconds
> > 2020-09-11 00:35:06.985392: [NET] peer(CHzf=E2=80=A61U30) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: s=
endto: no route to host
> > 2020-09-11 00:35:06.985751: [NET] peer(CHzf=E2=80=A61U30) - Removing al=
l keys, since we haven't received a new one in 540 seconds
> > 2020-09-11 00:35:06.987170: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting ke=
ypair
> > 2020-09-11 00:35:06.994062: [NET] peer(CHzf=E2=80=A61U30) - Awaiting ke=
ypair
> > 2020-09-11 00:35:12.160213: [NET] peer(CHzf=E2=80=A61U30) - Handshake d=
id not complete after 5 seconds, retrying (try 2)
> > 2020-09-11 00:35:12.160762: [NET] peer(CHzf=E2=80=A61U30) - Sending han=
dshake initiation
> > 2020-09-11 00:35:12.168432: [NET] peer(CHzf=E2=80=A61U30) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: s=
endto: no route to host
> > 2020-09-11 00:35:12.232323: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 5 seconds, retrying (try 2)
> > 2020-09-11 00:35:12.232701: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > [a few more]
> > 2020-09-11 00:55:13.793554: [NET] peer(CHzf=E2=80=A61U30) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: s=
endto: no route to host
> > 2020-09-11 00:55:13.823302: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 5 seconds, retrying (try 19)
> > 2020-09-11 00:55:13.823679: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 00:55:13.830352: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: s=
endto: no route to host
> > 2020-09-11 00:55:18.961279: [NET] peer(CHzf=E2=80=A61U30) - Handshake d=
id not complete after 5 seconds, retrying (try 20)
> > 2020-09-11 00:55:18.961761: [NET] peer(CHzf=E2=80=A61U30) - Sending han=
dshake initiation
> > 2020-09-11 00:55:18.969481: [NET] peer(CHzf=E2=80=A61U30) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: s=
endto: no route to host
> > 2020-09-11 00:55:19.013912: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 5 seconds, retrying (try 20)
> > 2020-09-11 00:55:19.014284: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 00:55:19.021406: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: s=
endto: no route to host
> > 2020-09-11 00:55:24.071094: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 20 attempts, giving up
> > 2020-09-11 00:55:24.072152: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 00:55:24.079339: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: s=
endto: no route to host
> > 2020-09-11 00:55:24.079992: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting ke=
ypair
> > 2020-09-11 00:55:24.083542: [NET] peer(CHzf=E2=80=A61U30) - Sending han=
dshake initiation
> > 2020-09-11 00:55:24.088956: [NET] peer(CHzf=E2=80=A61U30) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: s=
endto: no route to host
> > 2020-09-11 00:55:29.187685: [NET] peer(CHzf=E2=80=A61U30) - Handshake d=
id not complete after 5 seconds, retrying (try 2)
> > 2020-09-11 00:55:29.188175: [NET] peer(CHzf=E2=80=A61U30) - Sending han=
dshake initiation
> > 2020-09-11 00:55:29.195769: [NET] peer(CHzf=E2=80=A61U30) - Failed to s=
end handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: s=
endto: no route to host
> >
> > Log for when I woke up in the morning:
> > 2020-09-11 07:30:33.963812: [NET] Network change detected with unsatisf=
ied route and interface order [utun2, en0]
> > 2020-09-11 07:30:33.964685: [NET] DNS64: mapped redacted_peer_1 to itse=
lf.
> > 2020-09-11 07:30:33.970653: [NET] DNS64: mapped redacted_peer_2 to itse=
lf.
> > 2020-09-11 07:30:33.971174: [NET] DNS64: mapped wg_endpoint to itself.
> > 2020-09-11 07:30:33.972489: [NET] DNS64: mapped wg_endpoint to itself.
> > 2020-09-11 07:30:33.974145: [NET] UAPI: Transition to peer configuratio=
n
> > 2020-09-11 07:30:33.976164: [NET] peer(YhQB=E2=80=A6Lcm8) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:33.978041: [NET] peer(CHzf=E2=80=A61U30) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:33.978884: [NET] peer(gk0t=E2=80=A6AyAc) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:33.981027: [NET] peer(xmkD=E2=80=A6IMho) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:33.983182: [NET] Routine: receive incoming IPv4 - stop=
ped
> > 2020-09-11 07:30:33.985043: [NET] Routine: receive incoming IPv6 - stop=
ped
> > 2020-09-11 07:30:33.987112: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 07:30:33.989163: [NET] Routine: receive incoming IPv6 - star=
ted
> > 2020-09-11 07:30:33.991036: [NET] Routine: receive incoming IPv4 - star=
ted
> > 2020-09-11 07:30:33.993164: [NET] UDP bind has been updated
> > 2020-09-11 07:30:34.522914: [NET] Network change detected with satisfie=
d route and interface order [en0, utun2]
> > 2020-09-11 07:30:34.543799: [NET] DNS64: mapped redacted_peer_1 to itse=
lf.
> > 2020-09-11 07:30:34.546818: [NET] DNS64: mapped redacted_peer_2 to itse=
lf.
> > 2020-09-11 07:30:34.547362: [NET] DNS64: mapped wg_endpoint to itself.
> > 2020-09-11 07:30:34.548670: [NET] DNS64: mapped wg_endpoint to itself.
> > 2020-09-11 07:30:34.550471: [NET] UAPI: Transition to peer configuratio=
n
> > 2020-09-11 07:30:34.552311: [NET] peer(YhQB=E2=80=A6Lcm8) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:34.555128: [NET] peer(CHzf=E2=80=A61U30) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:34.555231: [NET] peer(gk0t=E2=80=A6AyAc) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:34.557314: [NET] peer(xmkD=E2=80=A6IMho) - UAPI: Updat=
ing endpoint
> > 2020-09-11 07:30:34.559804: [NET] Routine: receive incoming IPv6 - stop=
ped
> > 2020-09-11 07:30:34.561226: [NET] Routine: receive incoming IPv4 - stop=
ped
> > 2020-09-11 07:30:34.563905: [NET] Routine: receive incoming IPv6 - star=
ted
> > 2020-09-11 07:30:34.565256: [NET] Routine: receive incoming IPv4 - star=
ted
> > 2020-09-11 07:30:34.567279: [NET] UDP bind has been updated
> > 2020-09-11 07:30:37.309301: [APP] App version: 0.0.20200127 (17); Go ba=
ckend version: 0.0.20200121
> > 2020-09-11 07:30:39.013248: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 5 seconds, retrying (try 2)
> > 2020-09-11 07:30:39.013410: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 07:32:00.302471: [NET] peer(YhQB=E2=80=A6Lcm8) - Removing al=
l keys, since we haven't received a new one in 540 seconds
> > 2020-09-11 07:32:00.303803: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake d=
id not complete after 5 seconds, retrying (try 3)
> > 2020-09-11 07:32:00.304892: [NET] Received invalid response message fro=
m redacted_peer_1:44455
> > 2020-09-11 07:32:00.305435: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending han=
dshake initiation
> > 2020-09-11 07:32:00.308002: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting ke=
ypair
> > 2020-09-11 07:32:00.309891: [NET] peer(CHzf=E2=80=A61U30) - Handshake d=
id not complete after 5 seconds, retrying (try 14)
> > 2020-09-11 07:32:00.311963: [NET] peer(CHzf=E2=80=A61U30) - Sending han=
dshake initiation
> > 2020-09-11 07:32:00.372409: [NET] peer(YhQB=E2=80=A6Lcm8) - Received ha=
ndshake response
> > 2020-09-11 07:32:00.372697: [NET] peer(YhQB=E2=80=A6Lcm8) - Obtained aw=
aited keypair
> > 2020-09-11 07:32:00.529186: [NET] peer(CHzf=E2=80=A61U30) - Received ha=
ndshake response
> >
> > I normally try to toggle wireguard connection but it seems to hang so I=
 try to turn off/on wifi but
> > it appears that after about 1:30 min it fixes itself - this time I just=
 let it alone (I was actually looking at the logs)
> >
> > Would there anything I can do on my end or is a code update in the App =
required?
> >
> > Thank you.
> >
> > In reply to:
> >
> > -----------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
----------------------------------------------
> >
> > Alexander Burke alex atalexburke.ca
> > Thu Aug 27 10:29:10 CEST 2020
> >
> > I can=E2=80=99t speak for the Mac side, but I=E2=80=99ve been seeing th=
e same on iOS for months now.
> >
> > > /El 23 ag 2020, a les 20:34, Laura Smith <n5d9xq3ti233xiyif2vp at
> >
> > protonmail.ch https://lists.zx2c4.com/mailman/listinfo/wireguard> va
> > escriure: />//>/Hi, />//>/These aren't show-stoppers per-se, but it wou=
ld be nice to see them
> > fixed and new clients pushed out via the App Store: />//>/(1) MacOS (10=
.15.6 but also observed on 10.15.5, not tested on anything
> > older) />//>/- Start with WG client in an operational state />/- Discon=
nect network (e.g. if on WiFI, turn off the WiFi in the menu bar) />/- Slee=
p the machine />/- Wait- Wake the machine />/- Turn on Wifi />/- Note that =
WG client fails to re-establish connectivity (shows
> > connected, but no traffic flows until you deactivate/reactivate WG) /
>
>


--=20
{+} Jeff Squyres
