Return-Path: bruno@wolff.to
Received: from wolff.to (wolff.to [98.103.208.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with SMTP id 1d811b32
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Aug 2016 20:17:34 +0000 (UTC)
Date: Wed, 17 Aug 2016 15:17:27 -0500
From: Bruno Wolff III <bruno@wolff.to>
To: Joe Doss <joe@solidadmin.com>
Message-ID: <20160817201727.GA3094@wolff.to>
References: <919f5c60-4f1e-0f12-012b-021bce9aca5d@solidadmin.com>
 <CAHmME9oA9CeFr30WJwkEgamrFJrWX-rT3-NSsDLwcyybM7JbMw@mail.gmail.com>
 <1a66128e-2cb6-8f93-3769-d8011bf6a464@solidadmin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
In-Reply-To: <1a66128e-2cb6-8f93-3769-d8011bf6a464@solidadmin.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] Fedora WireGuard RPMs
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

On Wed, Aug 17, 2016 at 14:39:16 -0500,
  Joe Doss <joe@solidadmin.com> wrote:
>
>Also, SELinux is set enforcing by default on Fedora. I am not sure if 
>that is going to cause any issues either.

Users run unconfined (technically there are confined by a policy that lets 
them do almost anything) so generally there won't be a problem for stuff 
they run manually. However I did hit issues running stuff in a service. 
I didn't try to figure out what the correct fix was and kust added an 
allow rule. I suspect there was a better solution using labelling, but I 
didn't think it was worth worrying about.
