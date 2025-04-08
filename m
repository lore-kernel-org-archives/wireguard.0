Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3508C54E90
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 20 May 2025 23:11:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c98ede3;
	Tue, 20 May 2025 19:43:51 +0000 (UTC)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ad5b18b5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 8 Apr 2025 08:17:10 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2295d78b45cso67837215ad.0
 for <wireguard@lists.zx2c4.com>; Tue, 08 Apr 2025 01:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744100229; x=1744705029; darn=lists.zx2c4.com;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9fdElPioRI0btoB9YLHJoXBq7OTonUhGxAaIJ5PdYa8=;
 b=i2oHJ82Z0v10ZAbf8QY13SC/tMmwcjGEc8dwhXesSTHtmHS7UUo47eoqA+vY7KGvlg
 uymu2TrT+w8IENd/uNi9mSgpTUTO9tayE/TjRtgQQWoFlWuZzkKtgOgdq1hCQR1ISWVP
 VOcPr2CK9F1HCREfwFBEHILt8SuIcs4LabEwspTRv0XujJ0ExL6N+uKvKqHwnkxxJZhd
 3bOQHReVtUM7aihZFXSvtWaJYZ0sfz7Ja1jFHPCcFqo63URVYdz5KgXjQmsy/L565UjT
 EoNz3loWLm0b3cgQjc+AyJD4IlEiBHCRXafreHGHLaLNoHGi0+cUYVMpsfp9ufmjgXQR
 gXAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744100229; x=1744705029;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fdElPioRI0btoB9YLHJoXBq7OTonUhGxAaIJ5PdYa8=;
 b=kjl0zOGCreiyKuTMHSkZWh+ZyW0aFSF58XDja50jBr6pN1ARgfdho3tK10ReEaQ5pE
 Teuw1OpxiU73hC/2Ydc1rhPHU/iwOPl05x/sdEtJ6tE5tc9xwkDpXl8nq+pmnyQmTBnt
 Ior1uEvBMRjf2PHRilKnodOZn2hLHUxD2T4Jau6yrm7I4II1xopy6jJgF7LFXiuO2ny1
 jjxrgc9BXnOL9aF0oL50lyRU8mEtD3Lf9bpbCWQYQVUi4JBxObwPlMdvoICikKplLBK7
 Nj6PxNysJPdHLw0Tj3mWiqmQ3EN0fZNvrJic935Il+jUUfbbqJ6eO+ojFstX3UQT6VHs
 LKow==
X-Forwarded-Encrypted: i=1;
 AJvYcCWatvb6J+hL4xQgW9SsaEFwwqwdc6iOiIIGJkgl+N6N/Ps6MKp3KmWIDOFL8koLiOzAtu0oX5j9mYQ=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YxZHM5P93711anaZJ6rvp2NoQNUdrzNpnWN1gIyLQLP8c10r/a8
 9YJMpWwC++rpmbkikLHILjKj5jrPZoZM9HIaT3YtI3y6QEzj6aS4
X-Gm-Gg: ASbGncso33xpFczs3LuONwddF2w92H2jM/HhI8Fd4Eum8DRKSr3IINtnLyWiKGbre2u
 UnhhxdhzxJdr0eqKWaQZbuvzUUTODed97MDLgxLQHoIdzOR98phmBDEhR8V+HLbWQhpflLcdkmT
 gB9LVDeBXSEy81rNRTPWgnP+jCt/s6P2/lm217taUKSUjwRqbqhKiPFclb2tio0Fb+2KY+6h5iY
 SJSASM2f6el6lSymW1OlQFm57Gz9YZ/GE8lC2NsYbdXGWt1Rt0TsK/tUU6ebaRzx9twSDAZeJsb
 w6w2tHeo0Xn876cuyNsduaVylKwJ++m8l6+xSk68ula28zGMO5QPwmDmgTQ4Z6KW1zL1Dg==
X-Google-Smtp-Source: AGHT+IFe2CIssHzOnft5L6j+qBASQd7ICbxBKBKnPXX2l9y7vhFe+KHnO6lG9nf9EBuFFYKULvvZfQ==
X-Received: by 2002:a17:903:1b25:b0:220:e1e6:4472 with SMTP id
 d9443c01a7336-22a8a0545f9mr208034285ad.13.1744100228937; 
 Tue, 08 Apr 2025 01:17:08 -0700 (PDT)
Received: from fedora.dns.podman ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-229785ada20sm94319535ad.46.2025.04.08.01.17.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Apr 2025 01:17:08 -0700 (PDT)
From: Hangbin Liu <liuhangbin@gmail.com>
To: netdev@vger.kernel.org
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Simon Horman <horms@kernel.org>, Phil Sutter <phil@nwl.cc>,
 Florian Westphal <fw@strlen.de>, Petr Mladek <pmladek@suse.com>,
 Yoann Congal <yoann.congal@smile.fr>, wireguard@lists.zx2c4.com,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@gmail.com>
Subject: [PATCHv6 net-next 0/2] wireguard: selftests: use nftables for testing
Date: Tue,  8 Apr 2025 08:16:50 +0000
Message-ID: <20250408081652.1330-1-liuhangbin@gmail.com>
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

v6: fix typo in patch 1/2. Update the description (Phil Sutter)
v5: remove the counter in nft rules and link nft statically (Jason A. Donenfeld)
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

