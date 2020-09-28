Return-Path: <SRS0=AKvy=DF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B50A6C2D0A8
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Sep 2020 13:00:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C2F82068E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 28 Sep 2020 13:00:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="d5HjACgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C2F82068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be968e96;
	Mon, 28 Sep 2020 12:28:25 +0000 (UTC)
Received: from mail-40132.protonmail.ch (mail-40132.protonmail.ch
 [185.70.40.132])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c9e77acc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 28 Sep 2020 12:28:22 +0000 (UTC)
Date: Mon, 28 Sep 2020 12:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=protonmail; t=1601297988;
 bh=ovOgUWEAJCrlbYcx9EAaxdv4OrrGe7AUUjhVa/Q0hPQ=;
 h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
 b=d5HjACgm0QOLRg4JowZxFNS2+TLZrNlCRzBAP02Y89pykJeOYzfTcrG+bZ7Ua51lq
 RTvf93w0O4I16irvjfNWBQK+chQBeyYxocEr1fxg2EkJ8nqJ5BuoXnXDrBpp7Vxr+p
 pVrQsXBwSLwA07b+tBVoQUvqTlyOI1ldWZomwCog=
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
From: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Subject: Re: Two small Wireguard frustrations on Mac & Apple iOS
Message-ID: <_6C1kLqz08ZzDSlyJFksWGJkEabvSXjImi0ZpRw7s5bjUcMYcUlzSTUg1aUVzhnmAyYvGtMpSYff1DvoDw_vbLxel15gdVmkxtAjZWDp-w8=@protonmail.ch>
In-Reply-To: <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
References: <6650E7F9-7985-4DFC-9620-60FFE690C4F8@alexburke.ca>
 <010101747ab4aca3-491864e4-b0b7-474e-903e-035cd3fd9884-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Reply-To: Laura Smith <n5d9xq3ti233xiyif2vp@protonmail.ch>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I am starting to seriously consider switching back to OpenVPN.

Wireguard is great and all that, but frankly if there's not going to be any=
 effort by the developers to fix these Mac and iOS problems then I'm not go=
ing to stick around any longer.

I never had the sort of problems I described with OpenVPN, things such as h=
aving to check whether or not my VPN is still established should not be som=
ething I am forced to do.

I don't speak C or Swift so I can't offer to look at the code.

Laura

=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Friday, 18 September 2020 17:02, Eddie Jones <data.goldfish@oneacl.com> =
wrote:

> Hi,
>
> Sorry if this message comes out of thread, I wasn't subscribed when the m=
essages below were sent (I did click on the web link containing "in-reply-t=
o").
>
> I'm also seeing the same on iOS (an iPhone and an iPad) after I put them =
to flight mode (overnight or for more than a few hours).
> It seems to recover after a minute and a half but looking at the logs I a=
lso saw that handshakes are being attempted while in flight mode every ~ 10=
 minutes.
> This doesn't seem to affect battery life (significantly)
>
> sample log:
>
> -------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------------=
---------------------------------------------------------------------
>
> 2020-09-11 00:35:06.972422: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 5 seconds, retrying (try 3)
> 2020-09-11 00:35:06.972897: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 00:35:06.975534: [NET] peer(CHzf=E2=80=A61U30) - Handshake did=
 not complete after 5 seconds, retrying (try 6)
> 2020-09-11 00:35:06.978000: [NET] peer(CHzf=E2=80=A61U30) - Sending hands=
hake initiation
> 2020-09-11 00:35:06.980886: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sen=
dto: no route to host
> 2020-09-11 00:35:06.981306: [NET] peer(YhQB=E2=80=A6Lcm8) - Removing all =
keys, since we haven't received a new one in 540 seconds
> 2020-09-11 00:35:06.985392: [NET] peer(CHzf=E2=80=A61U30) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sen=
dto: no route to host
> 2020-09-11 00:35:06.985751: [NET] peer(CHzf=E2=80=A61U30) - Removing all =
keys, since we haven't received a new one in 540 seconds
> 2020-09-11 00:35:06.987170: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting keyp=
air
> 2020-09-11 00:35:06.994062: [NET] peer(CHzf=E2=80=A61U30) - Awaiting keyp=
air
> 2020-09-11 00:35:12.160213: [NET] peer(CHzf=E2=80=A61U30) - Handshake did=
 not complete after 5 seconds, retrying (try 2)
> 2020-09-11 00:35:12.160762: [NET] peer(CHzf=E2=80=A61U30) - Sending hands=
hake initiation
> 2020-09-11 00:35:12.168432: [NET] peer(CHzf=E2=80=A61U30) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sen=
dto: no route to host
> 2020-09-11 00:35:12.232323: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 5 seconds, retrying (try 2)
> 2020-09-11 00:35:12.232701: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> [a few more]
> 2020-09-11 00:55:13.793554: [NET] peer(CHzf=E2=80=A61U30) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sen=
dto: no route to host
> 2020-09-11 00:55:13.823302: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 5 seconds, retrying (try 19)
> 2020-09-11 00:55:13.823679: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 00:55:13.830352: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sen=
dto: no route to host
> 2020-09-11 00:55:18.961279: [NET] peer(CHzf=E2=80=A61U30) - Handshake did=
 not complete after 5 seconds, retrying (try 20)
> 2020-09-11 00:55:18.961761: [NET] peer(CHzf=E2=80=A61U30) - Sending hands=
hake initiation
> 2020-09-11 00:55:18.969481: [NET] peer(CHzf=E2=80=A61U30) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sen=
dto: no route to host
> 2020-09-11 00:55:19.013912: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 5 seconds, retrying (try 20)
> 2020-09-11 00:55:19.014284: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 00:55:19.021406: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sen=
dto: no route to host
> 2020-09-11 00:55:24.071094: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 20 attempts, giving up
> 2020-09-11 00:55:24.072152: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 00:55:24.079339: [NET] peer(YhQB=E2=80=A6Lcm8) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_1:44455: sen=
dto: no route to host
> 2020-09-11 00:55:24.079992: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting keyp=
air
> 2020-09-11 00:55:24.083542: [NET] peer(CHzf=E2=80=A61U30) - Sending hands=
hake initiation
> 2020-09-11 00:55:24.088956: [NET] peer(CHzf=E2=80=A61U30) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sen=
dto: no route to host
> 2020-09-11 00:55:29.187685: [NET] peer(CHzf=E2=80=A61U30) - Handshake did=
 not complete after 5 seconds, retrying (try 2)
> 2020-09-11 00:55:29.188175: [NET] peer(CHzf=E2=80=A61U30) - Sending hands=
hake initiation
> 2020-09-11 00:55:29.195769: [NET] peer(CHzf=E2=80=A61U30) - Failed to sen=
d handshake initiation write udp4 0.0.0.0:56035->redacted_peer_2:44455: sen=
dto: no route to host
>
> Log for when I woke up in the morning:
> 2020-09-11 07:30:33.963812: [NET] Network change detected with unsatisfie=
d route and interface order [utun2, en0]
> 2020-09-11 07:30:33.964685: [NET] DNS64: mapped redacted_peer_1 to itself=
.
> 2020-09-11 07:30:33.970653: [NET] DNS64: mapped redacted_peer_2 to itself=
.
> 2020-09-11 07:30:33.971174: [NET] DNS64: mapped wg_endpoint to itself.
> 2020-09-11 07:30:33.972489: [NET] DNS64: mapped wg_endpoint to itself.
> 2020-09-11 07:30:33.974145: [NET] UAPI: Transition to peer configuration
> 2020-09-11 07:30:33.976164: [NET] peer(YhQB=E2=80=A6Lcm8) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:33.978041: [NET] peer(CHzf=E2=80=A61U30) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:33.978884: [NET] peer(gk0t=E2=80=A6AyAc) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:33.981027: [NET] peer(xmkD=E2=80=A6IMho) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:33.983182: [NET] Routine: receive incoming IPv4 - stoppe=
d
> 2020-09-11 07:30:33.985043: [NET] Routine: receive incoming IPv6 - stoppe=
d
> 2020-09-11 07:30:33.987112: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 07:30:33.989163: [NET] Routine: receive incoming IPv6 - starte=
d
> 2020-09-11 07:30:33.991036: [NET] Routine: receive incoming IPv4 - starte=
d
> 2020-09-11 07:30:33.993164: [NET] UDP bind has been updated
> 2020-09-11 07:30:34.522914: [NET] Network change detected with satisfied =
route and interface order [en0, utun2]
> 2020-09-11 07:30:34.543799: [NET] DNS64: mapped redacted_peer_1 to itself=
.
> 2020-09-11 07:30:34.546818: [NET] DNS64: mapped redacted_peer_2 to itself=
.
> 2020-09-11 07:30:34.547362: [NET] DNS64: mapped wg_endpoint to itself.
> 2020-09-11 07:30:34.548670: [NET] DNS64: mapped wg_endpoint to itself.
> 2020-09-11 07:30:34.550471: [NET] UAPI: Transition to peer configuration
> 2020-09-11 07:30:34.552311: [NET] peer(YhQB=E2=80=A6Lcm8) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:34.555128: [NET] peer(CHzf=E2=80=A61U30) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:34.555231: [NET] peer(gk0t=E2=80=A6AyAc) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:34.557314: [NET] peer(xmkD=E2=80=A6IMho) - UAPI: Updatin=
g endpoint
> 2020-09-11 07:30:34.559804: [NET] Routine: receive incoming IPv6 - stoppe=
d
> 2020-09-11 07:30:34.561226: [NET] Routine: receive incoming IPv4 - stoppe=
d
> 2020-09-11 07:30:34.563905: [NET] Routine: receive incoming IPv6 - starte=
d
> 2020-09-11 07:30:34.565256: [NET] Routine: receive incoming IPv4 - starte=
d
> 2020-09-11 07:30:34.567279: [NET] UDP bind has been updated
> 2020-09-11 07:30:37.309301: [APP] App version: 0.0.20200127 (17); Go back=
end version: 0.0.20200121
> 2020-09-11 07:30:39.013248: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 5 seconds, retrying (try 2)
> 2020-09-11 07:30:39.013410: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 07:32:00.302471: [NET] peer(YhQB=E2=80=A6Lcm8) - Removing all =
keys, since we haven't received a new one in 540 seconds
> 2020-09-11 07:32:00.303803: [NET] peer(YhQB=E2=80=A6Lcm8) - Handshake did=
 not complete after 5 seconds, retrying (try 3)
> 2020-09-11 07:32:00.304892: [NET] Received invalid response message from =
redacted_peer_1:44455
> 2020-09-11 07:32:00.305435: [NET] peer(YhQB=E2=80=A6Lcm8) - Sending hands=
hake initiation
> 2020-09-11 07:32:00.308002: [NET] peer(YhQB=E2=80=A6Lcm8) - Awaiting keyp=
air
> 2020-09-11 07:32:00.309891: [NET] peer(CHzf=E2=80=A61U30) - Handshake did=
 not complete after 5 seconds, retrying (try 14)
> 2020-09-11 07:32:00.311963: [NET] peer(CHzf=E2=80=A61U30) - Sending hands=
hake initiation
> 2020-09-11 07:32:00.372409: [NET] peer(YhQB=E2=80=A6Lcm8) - Received hand=
shake response
> 2020-09-11 07:32:00.372697: [NET] peer(YhQB=E2=80=A6Lcm8) - Obtained awai=
ted keypair
> 2020-09-11 07:32:00.529186: [NET] peer(CHzf=E2=80=A61U30) - Received hand=
shake response
>
> I normally try to toggle wireguard connection but it seems to hang so I t=
ry to turn off/on wifi but
> it appears that after about 1:30 min it fixes itself - this time I just l=
et it alone (I was actually looking at the logs)
>
> Would there anything I can do on my end or is a code update in the App re=
quired?
>
> Thank you.
>
> In reply to:
>
> -------------------------------------------------------------------------=
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
--------------------------------------------
>
> Alexander Burke alex atalexburke.ca
> Thu Aug 27 10:29:10 CEST 2020
>
> I can=E2=80=99t speak for the Mac side, but I=E2=80=99ve been seeing the =
same on iOS for months now.
>
> > /El 23 ag 2020, a les 20:34, Laura Smith <n5d9xq3ti233xiyif2vp at
>
> protonmail.ch https://lists.zx2c4.com/mailman/listinfo/wireguard> va
> escriure: />//>/Hi, />//>/These aren't show-stoppers per-se, but it would=
 be nice to see them
> fixed and new clients pushed out via the App Store: />//>/(1) MacOS (10.1=
5.6 but also observed on 10.15.5, not tested on anything
> older) />//>/- Start with WG client in an operational state />/- Disconne=
ct network (e.g. if on WiFI, turn off the WiFi in the menu bar) />/- Sleep =
the machine />/- Wait- Wake the machine />/- Turn on Wifi />/- Note that WG=
 client fails to re-establish connectivity (shows
> connected, but no traffic flows until you deactivate/reactivate WG) /


