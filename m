Return-Path: <SRS0=Aoek=OD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C44C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Sep 2021 22:52:05 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5C9A60F51
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Sep 2021 22:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5C9A60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bamsoftware.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d42e30;
	Mon, 13 Sep 2021 22:49:55 +0000 (UTC)
Received: from melchior.bamsoftware.com (melchior.bamsoftware.com
 [2600:3c00:e000:128:de39:20ee:9704:752d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 25f10128
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Sep 2021 18:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bamsoftware.com; s=mail; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sOKTu7iNYF36Ynchq1DIh1IMZu2YyGkLu33cjQ34ZeE=; b=woySV5AijUBVUrpQkQ3ZamX2TO
 Be7vREweMd5OJ4JcsPW6kp/rNOSrbkOcHjusokNK4p9afWyoxtMce4hnlJIzKJvwhhtuoF+ay22j3
 BoBWT+qUqnirdGog9gtbp1TTI1OsCFAewbX7FTCEK6mDEsTfgP8CuD88g7Cq1UztAFio=;
Date: Mon, 13 Sep 2021 12:07:08 -0600
From: David Fifield <david@bamsoftware.com>
To: wireguard@lists.zx2c4.com
Subject: Reports of WireGuard blocking in Russia, September =?utf-8?Q?3?=
 =?utf-8?B?4oCTOCw=?= 2021
Message-ID: <20210913180708.t4u7i4ib7fubsjty@bamsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Mon, 13 Sep 2021 22:49:54 +0000
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

Last week, between about 2021-09-03 and 2021-09-08, there were reports
of failures to establish WireGuard sessions by some users in Russia. I
have not confirmed these reports personally. Tests by users found
connection failures in some ISPs and not others, and even different
conditions in a single ISP at different times. Self-hosted WireGuard as
well as commercial VPN services were apparently affected.

Discussion is happening (in Russian) in various places:
https://ntc.party/t/vpn/1107/13
https://ntc.party/t/rkn-will-try-to-block-the-following-vpn-services/1022/45
https://ntc.party/t/nordvpn/1249
https://www.opennet.ru/openforum/vsluhforumID3/125174.html#9
https://qna.habr.com/q/1043670

I tried to write a synthesis in English:
https://github.com/net4people/bbs/issues/76#issuecomment-915544316

Of note, Roskomnadzor, the Internet regulator in Russia, has, since
early this year, been implementing a long-term plan to block a list of
VPN services, and giving advance notice to entities such as banks.
WireGuard and OpenVPN are mentioned in a letter sent by the Ministry of
Education and Science on 2021-06-15, later posted to the Roskomsvoboda
Tech Talk Telegram channel.
https://github.com/net4people/bbs/issues/76#issuecomment-868088553

During the same time period as the problems with WireGuard, the Russian
ISP Rostelecom was reportedly blocking various BitTorrent protocols.
https://github.com/net4people/bbs/issues/83
This is potentially significant because a possible pattern for matching
uTP, one of BitTorrent's UDP-based protocols, is `^\x01\x00.+`, which
would also match the first initiator-to-responder message in WireGuard.
The uTP explanation is not fully satisfactory, though, because as I
understand it, users of multiple ISPs were having trouble with
WireGuard, while it was only Rostelecom blocking BitTorrent.

In general the Internet situation in Russia seems especially volatile at
the moment, perhaps because of upcoming elections. A news article about
a one-hour block of certain DNS/DoH/DoT servers that happened on
2021-09-08 incidentally mentions a block of the WireGuard protocol:
https://vc.ru/tech/291648-it-specialisty-zayavili-o-testirovanii-roskomnadzorom-massovoy-blokirovki-publichnyh-dns-servisov-google-i-cloudflare
> О частичной блокировке DNS-сервисов Google и Cloudflare также сообщил
> своём Telegram-канале эксперт «Общества защиты интернета» Михаил
> Климарёв. Он отметил, что полностью был заблокирован и VPN-протокол
> WireGuard.
>
> The partial blocking of Google and Cloudflare DNS services was also
> reported on his Telegram channel by Mikhail Klimarev, an expert of the
> Internet Defense Society Mikhail Klimarev. He noted that the WireGuard
> VPN protocol was also completely blocked.
