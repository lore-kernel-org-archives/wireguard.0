Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f035f4f7
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:04:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9352f2e
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:04:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a76e188a
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:04:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 72062795
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 29 Nov 2017 14:04:24 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id h9so3109285oti.0
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 06:10:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
 <20171129135124.GA29970@zx2c4.com>
 <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 29 Nov 2017 15:10:24 +0100
Message-ID: <CAHmME9pjU_5AncEkqYbnSUtB-h5h1nhrD5FXgkBia-sj=8jKrA@mail.gmail.com>
Subject: Re: multi-home difficulty
To: d tbsky <tbskyd@gmail.com>
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

Hi tbskyd,

This is on 4.14.2. Would you confirm that this is an issue on your
kernel by actually _running that script and sending the output to the
list_? It would also be helpful to have the output of uname -a.

Jason
