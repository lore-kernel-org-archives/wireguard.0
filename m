Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60602baa
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:24:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74f3fec0
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:24:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a57336c5
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:15:18 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 45b40cdb
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Jan 2018 17:15:18 +0000 (UTC)
Received: by mail-ot0-f172.google.com with SMTP id d9so1447350oth.6
 for <wireguard@lists.zx2c4.com>; Thu, 18 Jan 2018 09:27:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <f2e330d7-d4cb-f317-5774-05136fcb8b48@dd-wrt.com>
References: <b96c067bafcb48c3@frisell.zx2c4.com>
 <f2e330d7-d4cb-f317-5774-05136fcb8b48@dd-wrt.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 Jan 2018 18:27:37 +0100
Message-ID: <CAHmME9r5gkLJw3_mxxxNRjdk=HRsupm2Y9RFGLfSWC5G2o0NQA@mail.gmail.com>
Subject: Re: [ANNOUNCE] WireGuard Snapshot `0.0.20180118` Available
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
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

Thanks for the feedback. Indeed I'll have to go through this and
un-inline a few functions, and retest for performance.

If you wind up doing this iteratively and testing, please let me know
what you find.

Jason
