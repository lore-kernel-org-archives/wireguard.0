Return-Path: Jason@zx2c4.com
MIME-Version: 1.0
In-Reply-To: <CAK_h9uHiudc2d_qOJgQeQd7+8oB-Kgr8nN_S5Y1hsBUu==Zd1w@mail.gmail.com>
References: <CAK_h9uHiudc2d_qOJgQeQd7+8oB-Kgr8nN_S5Y1hsBUu==Zd1w@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 23 Nov 2017 01:20:48 +0100
Message-ID: <CAHmME9r=H0Kp_3HYvxB62c3-LcMDKnYaTt-nn7b93JToWg91mA@mail.gmail.com>
Subject: Re: Removing pre-shared key from peer using wg set fails
To: Tim Sedlmeyer <tim@sedlmeyer.us>
Content-Type: text/plain; charset="UTF-8"
Cc: WireGuard mailing list <WireGuard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

Hi Tim,

Thanks for letting me know. This is a tools regression from
0.0.20171111, which I just fixed, based on your report:

https://git.zx2c4.com/WireGuard/patch/?id=7153081da70006a8723474580543bd3223d1baf4

Let me know if this fixes the issue. It will be included in the next snapshot.

Regards,
Jason
