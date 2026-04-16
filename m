Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828D9F433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 16 Apr 2026 02:18:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id ad2d532d;
	Thu, 16 Apr 2026 02:18:37 +0000 (UTC)
Received: from mail-dl1-x1233.google.com (mail-dl1-x1233.google.com
 [2607:f8b0:4864:20::1233])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5c768015
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 16 Apr 2026 00:37:53 +0000 (UTC)
Received: by mail-dl1-x1233.google.com with SMTP id
 a92af1059eb24-12c19d23b19so8974841c88.0
 for <wireguard@lists.zx2c4.com>; Wed, 15 Apr 2026 17:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776299871; cv=none;
 d=google.com; s=arc-20240605;
 b=OjE0b5Abgxt6seDnS57w9GRUNsKrtD8BZcX0Lhn3caGcbDTyYBSw9l5p9zM1De3yy6
 7ekxeAIqNjnOTKxi3CQkh4jIWdWeYu6klDjI0etQQ96CSrbGmHDwWZ5vJkyOvPx5OYSr
 gDDv2xtkhL/nIhaevOR7tQkB8f+1pHZ3eQitkjN8w6nmOwphgMpBXLlmpTiKR2lfLEJk
 34Qf6gFFkZ7H2X2WWpHdMAnR7UIr4K6NQIELjdwzOtMrpCNCy8UUkAA3Vq1azicLydL5
 mhXdaYYpz+S0e3kpKRkxhf7eAlGapd//X/OaP6hTgLTmg7Pzv3w7jQC7PRma5RGCxTxj
 4XTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=to:subject:message-id:date:from:mime-version:dkim-signature;
 bh=xGSNXCuAsXPGg6XVXTgLLyC4fgmt2k54etxGdRdBYK0=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=JhKAw+q8BeXqBJr/77Lq0YvpFEJ4zudFzgUWcbsXLROh9XAnZ35zYPBXMDwqBSvxvG
 ya879+/Ydu9Tl6akEwXq966ShZldN9GQcXrXyWpA07mbe+6UILSgigUaFDG2wDNkD11l
 nVmnkC4iKPzOmqkeHHHplOOGEWJpoYgyU5iHFjBoqhg00+JH0EmFbgMEFRlDO3yZtn1/
 uQ/Oey7FJ7g5KS10NtjkBHaMenCMP7MkOuNXX+e+xUBU3Qlo8m2WbOgcer+p7XXZeR7L
 KRXkB3gCybfgvSaf15cePlm9hxlyL6yIk8+SZqPUFstDTLgFkohyextcQVNqUruA80t4
 P6ug==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776299871; x=1776904671; darn=lists.zx2c4.com;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xGSNXCuAsXPGg6XVXTgLLyC4fgmt2k54etxGdRdBYK0=;
 b=A/irMdvWbjdUqLns+D1QgSBxtL2fYNlKz2QAGjA9e+xYDiqSHDMeQCjpBc9KQD9HUh
 /WM03Bz8SFNN95bm4npsnj5proP/Z5XRp9dEsaG0Cr/dn1u5jOYoxId2dz/hYNGj3zka
 e3R2HHa3FQqbdWToJM8/p/MRzFhodRwTAHW/upesZinhnx+R08SI+wmJeugftAIKZ/RV
 2Zbdpoyjbm96Rvvl2RCC2K7QJjhE2OnnMrRZybaX/U92P8TmINcFd0x7GObXgI44RUFT
 bBxUx2RdJbMVG3GHaFenr5Ozm87Cv1jzkwMyN4vKtVT4ZhtiTauLnCD9m/ZPMdSqlvCw
 4tHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776299871; x=1776904671;
 h=to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xGSNXCuAsXPGg6XVXTgLLyC4fgmt2k54etxGdRdBYK0=;
 b=I58bhXcYE27QBQXHIOC71giAl5Jeczzk2MXMhaoG5E/YCt3JDg0uwQFhbqSxTwjza9
 gDCv5o1U8HZqFQfKXBCRGPve9txY/Zh5+tWxcEVBXn/oFuslsv+5Ccv0AOqtHxlOWmS3
 2SAB1KtKjOoa4u0l+UMMnXtAQ1oQszqAUfdz7F7rub906w/l2pCWRac6C23BhqlXzJ8Z
 lYs/smdIP5FWpn5gs6uRt4rmSuDrJN1ruGe3wNOWUUPfamc9XG81WxD8mXdJ/158lUVd
 WHHZKp1ucQqE1cBxMCjRCQ1R8tVpmbULvFGgEroaCrywTdJm/BArdyqpZmS3LBfYK7CF
 cuxA==
X-Gm-Message-State: AOJu0Ywvf8MweKcoOQAgApgrxP44/Wk8lxhdlYJDHQ230x7WdoNKY11R
 sOVZIq/5nCIkAbAawVS+aPDeKSuBTILC2s5dqtVz0gl5E5Xq06748bx2+vMjm1gKkGcc0z9NSz9
 TRnRlB0A54HNIsfizDwho3rpk4V1SuFX+I96lQO0=
X-Gm-Gg: AeBDievkRa3tYXqu7+qqQFTmmDtuqWonZnNOYdjGG9lVdkhwLp3nlgqvhzcT4WjsIuM
 OZqos6ZQtGyyr2VspfkRhM5ilhZpsyNivSDnZYK0p/Xmv3xBtSN4Fe1jSDUVmbTppzXGCJ4TjT6
 /0hKVDcK1evRh35k9caggcNDyV3Skq+TAFCYKuAU6bVz3sQcK6TUl14CVNmr38Aicqb59RqPOlC
 kE2rhdI4j8AOyLVUF6CTHeGU3Hjm5Mu9otpaz3FrMHryhaTlPPvGC/RB2/COTlTo71LFACGlVze
 pYtZCpw=
X-Received: by 2002:a05:7022:5f04:b0:12c:4928:e57a with SMTP id
 a92af1059eb24-12c4928e793mr4811419c88.5.1776299871125; Wed, 15 Apr 2026
 17:37:51 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?7Jik7ZWc7JuF?= <oho790114@gmail.com>
Date: Thu, 16 Apr 2026 09:37:39 +0900
X-Gm-Features: AQROBzAryGUw7HgVTnT5NaO5coGrWULo9-GAW9OwQVL7WGgb_shbV_n0T6RXt0k
Message-ID: <CABJHARCjTJ+T43++SkTam0RiHKvgxGqQJfAeGOOcF65SWCH5yA@mail.gmail.com>
Subject: WireGuard Windows 0.6.1 - Timeline of issues (tunnels lost & import
 still broken)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 16 Apr 2026 02:18:32 +0000
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

I would like to report a clear timeline of issues observed with
WireGuard for Windows (version 0.6.1).

April 14:
- After updating, all existing tunnels disappeared
- Importing new tunnels failed
  - ZIP files were not visible
  - "*.*" filter did not help
  - Drag and drop did not work

April 16:
- Existing tunnels no longer disappear after update (possibly improved)
- However, importing new tunnels is still not working
  - ZIP files are still not visible in the import dialog
  - "*.*" filter does not work
  - Drag and drop still fails

At this point:
- It is unclear whether the tunnel disappearance issue is fully fixed or not
- The import issue remains critical and consistently reproducible

Impact:
- Users cannot add new tunnels after installation or update
- This is affecting a production VPN service with multiple users

Please confirm:
- Whether there was a recent change in the update package
- Whether the import issue is a known bug
- When a fix can be expected

Thank you.
