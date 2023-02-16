Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EC3C6379F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Feb 2023 17:36:13 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d854abc;
	Thu, 16 Feb 2023 17:36:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d9bd07d6
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2023 17:36:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8B58F62061
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2023 17:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B517DC433A1
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2023 17:36:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FbSYtnfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1676568963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nupc2Boja2s159BTvtDdO8txkGAiP415J/fsW21RyxU=;
 b=FbSYtnfd1equ6R3hPhQVpZgaPGS+Jo0zPo6tcvNRrM1i6r1iah6KHGdBw7FirPriFnJUG5
 rsA7r8jhY+kWLa0AjwsM0zF7oQqpK58ObSeovyy3GVlnwyG5IcKDJDPBvQdbqUixF2yTfz
 kyB/3fe6/x0rP9Rap+t2UKShRc/L+RA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3a0cf55
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Feb 2023 17:36:03 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-4a263c4ddbaso35673137b3.0
 for <wireguard@lists.zx2c4.com>; Thu, 16 Feb 2023 09:36:03 -0800 (PST)
X-Gm-Message-State: AO0yUKUS+Jl9X0T2a5cyNcUIWnx4jAJp3lcygSo1vJNVHxne6r0cjSL3
 mCJjTXMxj8v1OsvpHFuXjsxD8peFqUTwGkmqZh4=
X-Google-Smtp-Source: AK7set+1vP4FdPPp3fMdTEs+rNjKskk4N0/rkQasYQmIbx7TzNsmrkfsDQ/q0lhyuqJnW4iNpmOiO3BeI1jG4xtQst0=
X-Received: by 2002:a81:6789:0:b0:533:18a7:3e49 with SMTP id
 b131-20020a816789000000b0053318a73e49mr544218ywc.173.1676568962422; Thu, 16
 Feb 2023 09:36:02 -0800 (PST)
MIME-Version: 1.0
References: <83474b0e-9e44-642f-10c9-2e0ff94b06ca@gmail.com>
In-Reply-To: <83474b0e-9e44-642f-10c9-2e0ff94b06ca@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 16 Feb 2023 18:35:51 +0100
X-Gmail-Original-Message-ID: <CAHmME9rMyYn4_HhUXVxOpbumPXu7eHNQA-r8nR=neKSAFxa-JA@mail.gmail.com>
Message-ID: <CAHmME9rMyYn4_HhUXVxOpbumPXu7eHNQA-r8nR=neKSAFxa-JA@mail.gmail.com>
Subject: Re: [Patch] [testing][wireguard] Remove unneeded version.h include
 pointed out by 'make versioncheck'
To: Jesper Juhl <jesperjuhl76@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 netdev@vger.kernel.org, wireguard@lists.zx2c4.com, 
 Shuah Khan <shuah@kernel.org>, Jakub Kicinski <kuba@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

No idea if this is something intended for me to apply or if it's an
automated email. Fix the formatting, resend, and then maybe I'll apply
it?
