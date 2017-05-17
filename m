Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34de4d7a
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:49:54 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 140359a6
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:49:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1d363658
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:49:54 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id fbe83cfd
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 May 2017 13:49:53 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id l18so16044291oig.2
 for <wireguard@lists.zx2c4.com>; Wed, 17 May 2017 07:01:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <87vap1gd2w.fsf@alrua-kau> <358B5193-8D9F-472F-8202-B81BAA022FDD@titanous.com>
 <1500fe21-c423-b34d-adf5-463b5d483cbf@higgsboson.tk>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 17 May 2017 16:01:16 +0200
Message-ID: <CAHmME9p4wtwUG8_4KvjdLcNcE33=BTWTNmWWX_eMWkiE=Z3Grw@mail.gmail.com>
Subject: Re: Text-based IPC for Userspace Implementations
To: =?UTF-8?Q?J=C3=B6rg_Thalheim?= <joerg@higgsboson.tk>
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

On Tue, May 16, 2017 at 9:26 PM, J=C3=B6rg Thalheim <joerg@higgsboson.tk> w=
rote:
> For the kernel, netlink will be used, which is already does its own seria=
lization format. The use of JSON here, would not make sense here.

Right. I'd indeed be very amused to see a JSON parser land in the Linux ker=
nel.

Jason
