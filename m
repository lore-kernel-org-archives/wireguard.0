Return-Path: <SRS0=ImwE=Z4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305D2C43603
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:11:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C26D824659
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Dec 2019 15:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=protonmail.ch header.i=@protonmail.ch header.b="EC0yb88s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C26D824659
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=protonmail.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c54a7e8b;
	Fri, 6 Dec 2019 15:11:06 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eee070fe
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:11:05 +0000 (UTC)
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch
 [185.70.40.141])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a45c01b
 for <wireguard@lists.zx2c4.com>; Fri, 6 Dec 2019 15:11:05 +0000 (UTC)
Date: Fri, 06 Dec 2019 15:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.ch;
 s=default; t=1575645058;
 bh=SSx36tD8EBCD8oygADaEKdE1AXxQ6n/H8JZyZdmwThk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
 Feedback-ID:From;
 b=EC0yb88sigwjwx8M+FlglQZW56OU8fmtAc1wVRzVlKAaufYkZVcRLPrZ76Wki0ZZM
 mICZFsY7yRNmhHdj7MtY6ek8MWdx/QbQpOaZZSP1+vqMNm/NZAQ/9fn5yuK1+xphQm
 G3MzxNqs29xHQiIfdfzALyDPxLQrdkfZBFFFWMrA=
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
From: Jordan Glover <Golden_Miller83@protonmail.ch>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20191205` Available
Message-ID: <NHVyo9ngt5xOvRvbPjQgDNH8pGe-_qN2sVDvP7jv2a6ZZRWd_0Ia9q6w2ZUTEdIQ_n-U-TRDxz-92_hnUpJTx_e-XlC180z5q1wWwF9q5rs=@protonmail.ch>
In-Reply-To: <fa4b08be3b6fee08@frisell.zx2c4.com>
References: <fa4b08be3b6fee08@frisell.zx2c4.com>
Feedback-ID: QEdvdaLhFJaqnofhWA-dldGwsuoeDdDw7vz0UPs8r8sanA3bIt8zJdf4aDqYKSy4gJuZ0WvFYJtvq21y6ge_uQ==:Ext:ProtonMail
MIME-Version: 1.0
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
Reply-To: Jordan Glover <Golden_Miller83@protonmail.ch>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Thursday, December 5, 2019 10:55 AM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Hello,
>
> A new snapshot, `0.0.20191205`, has been tagged in the git repository.
>
> Please note that this snapshot is a snapshot rather than a final
> release that is considered secure and bug-free. WireGuard is generally
> thought to be fairly stable, and most likely will not crash your
> computer (though it may). However, as this is a snapshot, it comes
> with no guarantees; it is not applicable for CVEs.
>
> With all that said, if you'd like to test this snapshot out, there are a
> few relevant changes.
>
> == Changes ==
>
> -   wg-quick: linux: suppress error when finding unused table
>
>     This fixes a spurious warning messages seen with recent versions of iproute2
>     and kernels.
>
> -   wg-quick: linux: ensure postdown hooks execute
> -   wg-quick: linux: have remove_iptables return true
> -   wg-quick: linux: iptables-* -w is not widely supported
>
>     Adding in iptables had some hiccups. For the record, I'm very unhappy about
>     having to put any firewalling code into wg-quick(8). We'll of course need to
>     support nftables too at some point if this continues. I'm investigating with
>     upstream the possibility of adding a sysctl to patch the issue that iptables
>     is handling now, so hopefully at somepoint down the line we'll be able to shed
>     this dependency once again.
>
> -   send: use kfree_skb_list
> -   device: prepare skb_list_walk_safe for upstreaming
> -   send: avoid touching skb->{next,prev} directly
>
> Suggestions from LKML.
>
> -   ipc: make sure userspace communication frees wgdevice
>
>     Free things properly on error paths.
>
>     This snapshot contains commits from: Jason A. Donenfeld.
>
>     As always, the source is available at https://git.zx2c4.com/WireGuard/ and
>     information about the project is available at https://www.wireguard.com/ .
>
>     This snapshot is available in compressed tarball form here:
>     https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191205.tar.xz
>     SHA2-256:
>     BLAKE2b-256:
>
>     A PGP signature of that file decompressed is available here:
>     https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20191205.tar.asc
>     Signing key: AB9942E6D4A4CFC3412620A749FC7012A5DE03AE
>
>     If you're a snapshot package maintainer, please bump your package version. If
>     you're a user, the WireGuard team welcomes any and all feedback on this latest
>     snapshot.
>
>     Finally, WireGuard development thrives on donations. By popular demand, we
>     have a webpage for this: https://www.wireguard.com/donations/
>
>     Thank you,
>     Jason Donenfeld
>

Hi, this release cause coredump on wg-quick down action:

systemd[1]: Stopping WireGuard via wg-quick(8) for wg0...
wg-quick[2241]: [#] iptables -D OUTPUT -o wg0 -j ACCEPT
wg-quick[2241]: [#] ip -4 rule delete table 51820
wg-quick[2241]: [#] ip -4 rule delete table main suppress_prefixlength 0
wg-quick[2257]: RTNETLINK answers: Address family not supported by protocol
wg-quick[2257]: Dump terminated
wg-quick[2258]: RTNETLINK answers: Address family not supported by protocol
wg-quick[2258]: Dump terminated
wg-quick[2241]: [#] ip link delete dev wg0
wg-quick[2241]: [#] resolvconf -d wg0 -f
wg-quick[2315]: [#] iptables-restore -n
audit[2316]: ANOM_ABEND auid=4294967295 uid=0 gid=0 ses=4294967295 subj==unconfined pid=2316 comm="iptables-restor" exe="/usr/bin/xtables-nft-multi" sig=11 res=1
wg-quick[2315]: /usr/bin/wg-quick: line 29:  2316 Segmentation fault      (core dumped) "$@"
kernel: show_signal_msg: 40 callbacks suppressed
kernel: iptables-restor[2316]: segfault at 0 ip 000064515b66fcc9 sp 00007e6bbcbfb720 error 4 in libnftnl.so.11.2.0[64515b66d000+18000]
kernel: Code: 15 5c 20 02 00 48 85 c0 74 07 48 89 00 48 89 40 08 48 83 c4 08 c3 66 66 2e 0f 1f 84 00 00 00 00 00 55 48 89 fd 53 48 83 ec 08 <48> 8b 3f 48 8b 1f 48 39 fd 74 2f 0f 1f 40 00 48 8b 47 08 48 89 43
systemd[1]: wg-quick@wg0.service: Succeeded.
systemd[1]: Stopped WireGuard via wg-quick(8) for wg0.

I saw some iptables related fix in git[1] but I don't know if
it's related to similar issue.

[1] https://git.zx2c4.com/WireGuard/commit/?id=884b6e36e6af0c6fa5b9467ccc8c2e2e4477bc95

Jordan
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
