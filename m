Return-Path: <SRS0=bcN2=E6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B18C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 08:06:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A04206D8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Nov 2020 08:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A04206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=matrix-dream.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e7d0c75;
	Tue, 24 Nov 2020 08:00:05 +0000 (UTC)
Received: from mail1.matrix-dream.net (mail1.matrix-dream.net [2a0a:51c0::71])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7778bae6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 24 Nov 2020 08:00:01 +0000 (UTC)
Received: from ivan by mail1.matrix-dream.net with local (Exim 4.92.2)
 (envelope-from <labawi-wg@matrix-dream.net>)
 id 1khTCj-0004sR-DY; Tue, 24 Nov 2020 07:57:37 +0000
Date: Tue, 24 Nov 2020 07:57:37 +0000
From: Ivan =?iso-8859-1?Q?Lab=E1th?= <labawi-wg@matrix-dream.net>
To: Matthias May <matthias.may@westermo.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: "roaming" between source ports does not work
Message-ID: <20201124075737.GA18512@matrix-dream.net>
References: <d8f3a1a9-1f5e-ce1e-06c7-5aab45396d97@westermo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8f3a1a9-1f5e-ce1e-06c7-5aab45396d97@westermo.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

Hello,

are you sure changing of source port is the issue?
Seems like something that would be reported a long
time ago.

Wireguard handshake fails, if your timestamps aren't
monotonically increasing - maybe this is the issue?

For confirmation - does connection fail on wg restart without
a device power cycle, or if you change the source port
while the tunnel is running?

If your device is power cycling on a schedule, without a RTC,
you should arrange an increasing nonce/time, if you can save
data, maybe use NTP or a workaround may be to remove and
re-add the peer on the server on a compatible schedule, 

Regards,
Ivan


On Sun, Nov 08, 2020 at 11:00:30PM +0100, Matthias May wrote:
> Hi
> 
> == Premise
> * I've recently implemented support for wireguard in our LTE-router.
> 
> == Source Environment
> * The basis is OpenWRT.
> * Used versions:
> * On the client/initiator:
>  * wg
>   * 1.0.20200908
>   * ad33b2d2267a37e0f65c97e65e7d4d926d5aef7d530c251b63fbf919048eead9
>  * wg-tools
>   * 1.0.20200827
>   * 51bc85e33a5b3cf353786ae64b0f1216d7a871447f058b6137f793eb0f53b7fd
> * On the server/responder:
>  * Debian stretch (9.13), installed from repository
>  * deb http://deb.debian.org/debian/ unstable main
>  * # wg --version
>  * wireguard-tools v1.0.20200827
>  * I don't really know what the version of the build dkms is
> 
> == Issue
> * We've implemented an automated test that seems to have a problem.
>  * Each night, the device is configured to connect to the debian box.
>   * This works fine the first time.
>   * However it doesn't work anymore after this first time.
> 
> == Observerion
> When the "client" connects the first time, wg-output on the "server"
> looks like this:
> > interface: wg1
> >   public key: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=
> >   private key: (hidden)
> >   listening port: 51821
> >
> > peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
> >   endpoint: 172.29.42.230:38442
> >   allowed ips: 10.0.41.3/32
> >   latest handshake: 44 seconds ago
> >   transfer: 8.01 MiB received, 7.96 MiB sent
> 
> and on the "client:
> > interface: wg1
> >   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
> >   private key: (hidden)
> >   listening port: 38442
> >
> > peer: 7GxCG4m+6Kf4wjJ9vbQaGFASLGXLB5ddPWgBYw4gOk8=
> >   endpoint: 172.29.60.13:51821
> >   allowed ips: 10.0.41.0/24
> >   latest handshake: 1 minute, 3 seconds ago
> >   transfer: 187.06 KiB received, 189.96 KiB sent
> 
> Ports and IPs match, everything works.
> 
> However on the second run of the test:
> On the "server" still:
> > peer: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
> >   endpoint: 172.29.42.230:38442
> >   allowed ips: 10.0.41.3/32
> >   latest handshake: 4 minutes, 52 seconds ago
> >   transfer: 8.05 MiB received, 7.99 MiB sent
> 
> But the "client" shows:
> > interface: wg1
> >   public key: fizBdi/YkdzFLaq6Hnq+OZaGmbJBYC15QSP1Mik/EFU=
> >   private key: (hidden)
> >   listening port: 47858
> 
> The client device has been restarted in between.
> 
> Since the listen-port is set to 0, it obviously has now a new,
> different, source-port.
> The server doesn't pick this up.
> Since peers may roam between IPs, i was under the impression, that it
> would also roam between ports.
> 
> 
> Is this working as intended?
> If yes: How should the configuration look like to support clients doing
> a power-cycle?
> 
> 
> I'm aware, that i could set a static port on the client, but this won't
> work when going through NAT with port-scrambling.
> So i don't really have control over the source-port of the connection
> anyway.
> I suppose this would also apply when a router/firewall inbetween has
> some aggressive killing of states where the keepalive is not fast
> enough, and source-port scrambling is done.
> 
> But the main usecase i'm looking at here is: restart of a device.
> 
> BR
> Matthias
