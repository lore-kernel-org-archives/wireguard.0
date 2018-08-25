Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0f59ea25
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:13:10 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b88b2b01
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:13:10 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a1b3f8c4
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:11:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e24c8109
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Aug 2018 05:11:56 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id x197-v6so1172536oix.5
 for <wireguard@lists.zx2c4.com>; Fri, 24 Aug 2018 22:26:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAFafqTtD_Qk9pSZvurmg6tsWFyYLOarqJmA5bizpygxuOmPqbQ@mail.gmail.com>
In-Reply-To: <CAFafqTtD_Qk9pSZvurmg6tsWFyYLOarqJmA5bizpygxuOmPqbQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Aug 2018 23:26:10 -0600
Message-ID: <CAHmME9qMGNfdJLNFAaPezOc11Wi9EGHRV-d2+jdYok1W-aL36Q@mail.gmail.com>
Subject: Re: [PATCH 1012/1012] Support for unicode interface names: only '%',
 ':' and '/' must be avoided
To: jorgeanton@gmail.com
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

Indeed it looks like we could be slightly more permissive. From net/core/dev.c:

/**
*      dev_valid_name - check if name is okay for network device
*      @name: name string
*
*      Network device names need to be valid file names to
*      to allow sysfs to work.  We also disallow any kind of
*      whitespace.
*/
bool dev_valid_name(const char *name)
{
       if (*name == '\0')
               return false;
       if (strnlen(name, IFNAMSIZ) == IFNAMSIZ)
               return false;
       if (!strcmp(name, ".") || !strcmp(name, ".."))
               return false;

       while (*name) {
               if (*name == '/' || *name == ':' || isspace(*name))
                       return false;
               name++;
       }
       return true;
}

And earlier in the callstack, %d is checked for, which indeed adds %
to the blacklist, as your commit indicates.

But should wg-quick enable insane dev names?
