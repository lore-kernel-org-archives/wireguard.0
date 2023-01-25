Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEBBC636CD
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 Feb 2023 04:33:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id afd50038;
	Tue, 7 Feb 2023 04:29:45 +0000 (UTC)
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [2607:f8b0:4864:20::32f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id caa96a9c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 25 Jan 2023 16:13:48 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 39-20020a9d032a000000b006884aad0b15so1430250otv.12
 for <wireguard@lists.zx2c4.com>; Wed, 25 Jan 2023 08:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NIo3UxTnmfivJFlEKzzWu/L9/ZBKXUAEAwDFxvMOsVs=;
 b=Yqu6kRWJOBKPm98ofrbBm14VoHdNUSIM1zn0KDUQ/b6goY+y9iwv5VW7pSdXn6V33U
 xEA8Demn6mIvPssjPZOz9SSsC16kMy2SpNz6F+nhNpQNyIq9MfQhthYyIimSeTo0vo1G
 LFZ7Yegx1IkfadB3El71ir2bg+ZZhUSThV/hawGpJ8bl1e9Mb48BXDVlIAO65cPTVunp
 2ZLSHpPnZAiCm9Uc1QUGUMTqYvQUePLpyF//Pc1vk+U20mzmBny/zF9VVmgYkWsBaOWw
 xAAqFhM9MHP8k6pzxoXXlrzu5gQiSKwy24wKoPBKfzNbwERGTWGTIb5dSVEcZjQfbqc+
 6bnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NIo3UxTnmfivJFlEKzzWu/L9/ZBKXUAEAwDFxvMOsVs=;
 b=6XVZbw6ciKuhThSh6K/K+6BiHIZwD1BksTqL+Sw8NqkEaX6TwaI7S1a42DDw5kLfaE
 ov6dNu+epN/rOKHjj1Vo9XF+HHVPlqajADFtsWrfrc81HKKHJ+QIwosz1CyePHeiPICo
 5a64DAZOuoZ3nftp+eEU7fUszJtqfcc9j9fcgdHOBsZ6+Mp8ezy83JCaBkYCMAr5zbew
 wEY0bAzd+96bZarCmte95IazzEOGT3xVBqvEGzb3Epfzlc9wWln4LIVgcnrmjpVjedTN
 TSLpdSSNJqGqEX3Oqu/xQEiS9pBrWtdrd07KJwmvAW4/qGH7lkiNIbWgWwHnIZxh/y++
 9nZQ==
X-Gm-Message-State: AFqh2kraXdkiCDqw1Wly+H+7ncYK7PwEaocQ3lH7UKer7+BEZr7qA/4T
 rgAGbbqWrbH761d2qCr8cmu67GXxHwN8dwE/k8SRtqIbmjA=
X-Google-Smtp-Source: AMrXdXsW6HrqGl3VVUWHFuaJovbaZbS1Fm4ow7pJn9Bowcud89Qd23GG6s2WKKYWgYLcxKh7sk2jimTELxZGCWqnTwo=
X-Received: by 2002:a9d:333:0:b0:684:c520:d7a3 with SMTP id
 48-20020a9d0333000000b00684c520d7a3mr1695972otv.126.1674663226526; Wed, 25
 Jan 2023 08:13:46 -0800 (PST)
MIME-Version: 1.0
From: Andy Xheli <andyxheli@gmail.com>
Date: Wed, 25 Jan 2023 10:13:36 -0600
Message-ID: <CAPJ9KJ89+xZMs9uc2bVZWU=FpDoJSygJ3QCWr5qv5-x3=VOJdA@mail.gmail.com>
Subject: VPN Client don't not disconnect while server is offline
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 07 Feb 2023 04:29:34 +0000
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

Hi All,

So I noticed that when I bring down the WireGuard server all the
clients still show as connected\active. I noticed it because I brought
the server down and I was not able to get out to the internet. I'm
doing a split tunnel. I only route my internal network via wireguard
and I have set it to use the dns server on my internal network. Looks
like it is still trying to use the DNS server via vpn client even if
the server is off. I think there should be a better way to handle the
connections if the server is offline. The client should not show
connected\active or try not to use dns via wiregaurd if the server is
offline.

What do you all think?
