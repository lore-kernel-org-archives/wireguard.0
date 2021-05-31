Return-Path: <SRS0=EcsN=K2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A51C47082
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 May 2021 07:49:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE6C361278
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 31 May 2021 07:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE6C361278
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14fda69e;
	Mon, 31 May 2021 07:49:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7d2e0ce1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 31 May 2021 07:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622447383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=3nKPg9fm+/y2WHqfpj1ZOs7Xdegu+P2c6+SRSPrzJ9Y=;
 b=HZQOF5AV88L7n2QZLcI5xq9fNhxJhU1Wy7SGBXpMeQojCqpiT9iDcRg3Kcz9NMAWFbZqC/
 JnDN+OlN6bCW3HHsYpUgNscTGv5BfK5UE1bj4fuhJxWiVteKmE50aiTjnz+8TmBi8hsLPK
 9eO6S2hLPE5BkWyqX9FjUPfAur1k4LM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2cafe54
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Mon, 31 May 2021 07:49:43 +0000 (UTC)
Date: Mon, 31 May 2021 09:49:40 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com, cgit@lists.zx2c4.com,
 password-store@lists.zx2c4.com
Subject: IRC channels #wireguard, #cgit, and #pass open on Libera.Chat
Message-ID: <YLSVFMi9oGKzfUGk@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

The IRC channels #wireguard, #cgit, and #pass will now be on Libera.Chat in
official capacity. This means that you can now connect with other users and
developers of these projects by pointing your IRC client at:

    Server: irc.libera.chat
    Port: 6697 with TLS (aka "ssl" or "secure port")
    Channel: #wireguard, #cgit, and #pass

On Weechat:

    /server add libera irc.libera.chat/6697 -ssl -autoconnect -autojoin=#wireguard,#cgit,#pass
    /save
    /connect libera

On irssi:

    /network add libera
    /channel add -auto #wireguard libera
    /channel add -auto #cgit libera
    /channel add -auto #pass libera
    /server add -network libera -auto -tls irc.libera.chat 6697
    /save
    /connect libera

Users who want to simply pop online ephemerally to ask a quick question can
also use the web interface: <https://web.libera.chat/#wireguard>. Though do
note that the community generally appreciates it when people maintain a more
continuous presence logged in ("idling"). For folks who want to connect to IRC
longer term, but don't want to futz around with overly technical things,
services like IRCCloud.com (paid) and Matrix.org (free) offer a way of staying
connected to IRC networks from your web browser and mobile phone.

With large swaths of the free software community recently departing our old
home of freenode, the choice was between the new Libera.Chat IRC network, the
venerable OFTC IRC network, and something newfangled like Slack, Discord,
Mattermost, Rocket.Chat, Zulip, or `ncat -l -k --chat`. This choice was not
easy.

The primary advantage of the newer platforms is their broader accessibility to
less technical users and expanded feature sets. Their disadvantage is that
they are standalone/siloed tools, which don't promote cross-pollination
between our community and other communities. In contrast, the primary
advantage of IRC in general over the more recent communication tools is the
community around IRC. Somebody hanging out over in #archlinux asking a
question about WireGuard is easily referred to #wireguard for additional
troubleshooting, and vice versa. And different types of users and developers
frequently meet and share ideas. It is a commons of sorts. There are
additional differences between the platforms (with keywords like "javascript"
or "licensing" or "curmudgeonly"), but this distinction between being part
of the larger community and free software ecosystem, and not, strikes me as a
critical basis of decision.

In deciding between Libera.Chat and OFTC, the decision was a bit harder, but
ultimately was made with the same principle in mind. OFTC is old and stable,
having apparently few governance issues over a long history. In contrast,
Libera.Chat is brand new and was created by a group of volunteers that, while
having an impressive history of running freenode successfully for many years,
have just emerged from a highly publicized conflict. However, Libera.Chat
hosts a significantly larger portion of the free software community than OFTC.
Seeing that our motivation for remaining on IRC in the first place is
community, going with the larger network makes most sense, even if it does not
yet have a proven track record of stability.

I hope that rationale makes sense. See you all in the new channels.

Thanks,
Jason


PS: WireGuard community members, enthusiasts, contributors, and developers can
now request a "wireguard/tunneler/{nick}" cloak from Mira (mira), Aaron
(amdj), or me (zx2c4). Shoot one of us a message on IRC and we'll set it up.
