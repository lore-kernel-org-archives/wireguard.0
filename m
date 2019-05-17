Return-Path: <SRS0=ghx5=TR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F65C04AB4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 May 2019 13:39:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B7C2087E
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 17 May 2019 13:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B7C2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wolff.to
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77aaaca8;
	Fri, 17 May 2019 13:38:55 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31d197f2
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 13:38:54 +0000 (UTC)
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id d9a9b23f
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 May 2019 13:38:54 +0000 (UTC)
Received: (qmail 16754 invoked by uid 500); 17 May 2019 13:36:03 -0000
Date: Fri, 17 May 2019 08:36:03 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: Working on change for: genetlink: make policy common to family
Message-ID: <20190517133603.GA16695@wolff.to>
References: <20190513195213.GA30315@wolff.to> <20190513202453.GA30656@wolff.to>
 <20190513212110.GA31106@wolff.to> <20190514205016.GA920@wolff.to>
 <20190515105014.GA12390@wolff.to> <20190515110636.GA12769@wolff.to>
 <20190515111830.GB12769@wolff.to> <20190515113325.GA13034@wolff.to>
 <CAHmME9qBF_NaThCCA-Q62mV=qGXzirzO7yVvVOEYg9w_gfRJSw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHmME9qBF_NaThCCA-Q62mV=qGXzirzO7yVvVOEYg9w_gfRJSw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Fri, May 17, 2019 at 13:12:07 +0200,
  "Jason A. Donenfeld" <Jason@zx2c4.com> wrote:
>Thanks for getting this started. This commit should take care of it:
>
>https://git.zx2c4.com/WireGuard/commit/?id=7a83d1e6da8aa27da8fd4d06e6b7d11198c7c049

Thanks for the fix. I'm using it with Fedora's 5.2.0-0.rc0.git8.1.fc31.x86_64 
kernel successfully. (Note not all arches built successfully with that 
kernel, but it was the latest for x86_64 I could get right now for testing 
a 5.2 kernel with the new fix.)
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
