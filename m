Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d7a908fc
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:10:23 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a4e05c59
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:10:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3061351f
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:10:23 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d85060e5
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Jan 2017 22:10:23 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id 3so489340558oih.1
 for <wireguard@lists.zx2c4.com>; Sun, 08 Jan 2017 14:19:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7ec50275-f586-763a-2f70-c68321ef9a17@higgsboson.tk>
References: <6d000312-635f-a361-200a-936da7ce7e17@web.de>
 <CAHmME9p4WOB96v6P1E2yGZcpEXdRfG7e=vK1nUwCE953tx1SSA@mail.gmail.com>
 <89477ad4-b015-d0a1-1c05-ea6600b2f464@web.de>
 <20170108141216.GB6421@tuxmachine.polynome.dn42>
 <7ec50275-f586-763a-2f70-c68321ef9a17@higgsboson.tk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Jan 2017 23:19:53 +0100
Message-ID: <CAHmME9o6KDKQu568VcJO1LC1Lw8guSCX5-gTud8wqSv_WA8R0w@mail.gmail.com>
Subject: Re: Multiple Endpoints
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
Content-Type: text/plain; charset=UTF-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Sun, Jan 8, 2017 at 3:39 PM, J=C3=B6rg Thalheim <joerg@higgsboson.tk> wr=
ote:
>> I am also interested in multiple endpoints support, and I am preparing a
>> proposal that I will send soon.
>>
>
> Does your proposal also includes support for different address family? (s=
witch between ipv4/ipv6 and back)

So presumably what's needed is someway to specify multiple endpoints
per peer, and have the handshake retry mechanism cycle through the
list of endpoints, reordering them based on success. This doesn't seem
very difficult or complicated. I'll read some literature to see if
there have been some nice ideas on this in the past (multipath mosh
etc) and also examine whatever it is Baptiste has been cooking up.
