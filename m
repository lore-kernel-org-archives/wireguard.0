Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C1CC54FB3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 May 2025 03:26:51 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ea36ac8;
	Tue, 27 May 2025 03:26:50 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [2607:f8b0:4864:20::430])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 405a2743
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 May 2025 03:26:48 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-7426c44e014so2140152b3a.3
 for <wireguard@lists.zx2c4.com>; Mon, 26 May 2025 20:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748316406; x=1748921206; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=X+dQKs4smeHKhBn5vB7/b04LpJegWUgXprxkxS6zC3s=;
 b=TnRG8ckAEQLqgSxZQQ/UeVN/AZUqGYTvPvWUXhTsDTaNzgKrzUT9R7u+gQFOpoImmL
 KGqdlii8f6ySJ1Q2iUib8gtyXhERtw5SDT9PzVNekd2pE5XCYMS3ZOdwFHzjF7ASXoW4
 SWKjjFApqgihO+0umj6Cc3i0RHYbJXs3EAS/QWdzTDFpg2Kp7M/E8VgyWwLBeUzCkU3Q
 RcM3eDaRJS5GmcXRPtuNzS+NiwZtzSTh/M6O5SP2qh8n/qesGo3WXHJ10mwOZsusZPdl
 ctuQCZZWOd02xbC3z5xozaOE9mJbwWE33BcNj9K1jE9xlHmOjumejqUrY0vLWMIM9PPf
 IQ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748316406; x=1748921206;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X+dQKs4smeHKhBn5vB7/b04LpJegWUgXprxkxS6zC3s=;
 b=jLH4y/y4Illp1zoO33JBZCFiI0qxTpa/lFLXjZY0ESz2aDx1XG/CgHl5bE71dC8Iw0
 aSjOR2jFUgu0yzY9m8sFM6nU/i0/KB2WxN1A55qqhtvPkTvbcK3lJxNBLV6eutT8sm6B
 cI/sJm2cARmk+hiEhZmAvBdDk0GXkplD3faBw11dHWNx9cV9UKdUNTt7qNsIh3U4fJ2+
 FOtO7t5dvHqiSqxWnCR25IdDzGaB2eAQ7P8SR3+w3yim/j2abpBYJCr6kILjuUeYZmaS
 pSehJnIRX8UjjThjsaRqx76bHXt28MMDXgJ7XNPq90iczGYkNBF/1py/rufCqBqADWDA
 nXoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp6kjPZNisHN945jh5sqdcHqzzjn2XHaPlcuXacqA8kG8E130qQg6agZOh5b9Tqx9TmXBNLW7yX3M=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yysq6UhB8fv09mdTcTWEQz5Aokn9oeGZOPssMD3fDl9BBH6XmGf
 8dWb6u1aaUMj8pccpzTsyaZILaKS6igL1ZBDJEtrDKQpecLDHEWwgoK0
X-Gm-Gg: ASbGncvaBkNO2K7iNfqt2AGHpmAsLyCj44tKvaIhOmUR4sG0QdOi9dZd54Lcz7nPPrg
 LC0Rh2KoEMYwKgCgfXCVdKO6ZrQ1D63wpKMS4AbYh0RfUhby3UkDqU3usnUBvMuWRYNJXWcwAd1
 d0HcYtcQ1tF66cdfyGUfsLYkIQ98F2BmNpq9DrE8fbeduGANOhXRW0BR4t4wIYKufL3vqf5vhes
 Js0nuL2HRV5EV+bU7gWagN21o5FDXJotKilotrlAxW/lplueIV6kyhUEBvhn1gtlzxYxj5aqteV
 AAsIHJCzpNKFSYpIc9yqk9toVD0gYMGBLmF9Uuy5PSsXEdWV2wvtA0QZrEXE1cIq6w/Kzes=
X-Google-Smtp-Source: AGHT+IGgF85+/TM8/Lb9bTE3REIcJSRSSaneox0Iitx/fr11aMcDr510JMXivb83lsKssFF1zcKoxw==
X-Received: by 2002:a05:6a00:f0d:b0:746:285b:595c with SMTP id
 d2e1a72fcca58-746285b5bdamr1242815b3a.8.1748316406483; 
 Mon, 26 May 2025 20:26:46 -0700 (PDT)
Received: from fedora.dns.podman ([209.132.188.88])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74622b3b481sm865926b3a.131.2025.05.26.20.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 20:26:45 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv7 RESEND wireguard 0/2] wireguard: selftests: use nftables for
 testing
Date: Tue, 27 May 2025 03:26:33 +0000
Message-ID: <20250527032635.10361-1-liuhangbin@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This patch set convert the wireguard selftest to nftables, as iptables is
deparated and nftables is the default framework of most releases.

v7: re-post, no update.
v6: fix typo in patch 1/2. Update the description (Phil Sutter)
v5: remove the counter in nft rules and link nft statically (Jason A.
Donenfeld)
v4: no update, just re-send
v3: drop iptables directly (Jason A. Donenfeld)
    Also convert to using nft for qemu testing (Jason A. Donenfeld)
v2: use one nft table for testing (Phil Sutter)

Hangbin Liu (2):
  wireguard: selftests: convert iptables to nft
  wireguard: selftests: update to using nft for qemu test

 tools/testing/selftests/wireguard/netns.sh    | 29 +++++++++------
 .../testing/selftests/wireguard/qemu/Makefile | 36 ++++++++++++++-----
 .../selftests/wireguard/qemu/kernel.config    |  7 ++--
 3 files changed, 49 insertions(+), 23 deletions(-)

-- 
2.46.0

