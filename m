Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fefde85
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:17:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 625fb3dc
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:17:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e35be0ba
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:37:00 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 74a4ebb9
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Aug 2017 12:37:00 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id 77so23023574itj.1
 for <wireguard@lists.zx2c4.com>; Wed, 02 Aug 2017 05:39:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170802122935.GA21536@wolff.to>
References: <20170802121920.GA3119@wolff.to> <20170802122430.GA11203@wolff.to>
 <20170802122935.GA21536@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Aug 2017 14:38:59 +0200
Message-ID: <CAHmME9qwUezvL6Aab+r=DSqZ8RtFB-odpBZ70_2SAheL58A66w@mail.gmail.com>
Subject: Re: Compile time assertion failure
To: Bruno Wolff III <bruno@wolff.to>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hey Bruno,

Thanks for the report. Looks like I was relying on optimization
behavior of a gcc newer than yours. I'll revert.

Jason
