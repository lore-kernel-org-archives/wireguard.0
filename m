Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e6213111
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 00:27:38 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a471e74
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 00:27:38 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ed42299
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 00:18:46 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e7d957c3
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 14 Apr 2018 00:18:46 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id o9-v6so11764600otj.5
 for <wireguard@lists.zx2c4.com>; Fri, 13 Apr 2018 17:41:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180326225357.4520db1c@vega.skynet.aixah.de>
References: <4993616.ZASKD2KPVS@scorpbook>
 <20180326225357.4520db1c@vega.skynet.aixah.de>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 14 Apr 2018 02:41:49 +0200
Message-ID: <CAHmME9rKi5QhNcrfpNC522Z9nqYKWfaK-0YALqibSScJ6UM1tw@mail.gmail.com>
Subject: Re: Some potential bug in wg-quick re. fwmark and default route
To: Luis Ressel <aranea@aixah.de>
Content-Type: text/plain; charset="UTF-8"
Cc: Saeid Akbari <saeidscorp@yahoo.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Saeid,

Your email got sent to my spam folder. Sorry about that. Thanks for
following up on this, Luis.

Based on Luis' analysis and first patch, I've written a fix here:
https://git.zx2c4.com/WireGuard/commit/?id=406709a6cfee08139daf6f6a58088c45e125e291

Let me know if this works as you expected.

Jason
