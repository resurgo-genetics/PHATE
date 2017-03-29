#!/usr/bin/env python3

import phate

def main(argv=None):
    #generate DLA tree
    M, C = phate.tree.gen_dla(n_dim = 100, n_branch = 20, branch_length = 100,n_drop = 0, rand_multiplier = 2, seed=37, sigma = 4)

    #run phate
    X = phate.PHATE().fit_transform(M)

    with open(os.path.join(args.output, 'phate_tree.csv'), 'wb+') as f:
        np.savetxt(f, embedding, delimiter=',')

if __name__ == '__main__':
    sys.exit(main())